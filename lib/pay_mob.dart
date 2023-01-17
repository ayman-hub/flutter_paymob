library pay_mob;

import 'package:flutter/material.dart';
import 'package:pay_mob/data/model/OrderRequest.dart';
import 'package:pay_mob/data/model/PaymentKeyRequest.dart';
import 'package:pay_mob/data/model/PaymentKeyResponse.dart';
import 'package:pay_mob/data/model/TransactionModel.dart';
import 'package:pay_mob/data/model/WalletResponse.dart';
import 'package:pay_mob/data/remote/dio_helper.dart';
import 'package:pay_mob/data/remote/remote.dart';
import 'package:pay_mob/print_types.dart';
import 'package:pay_mob/web_view.dart';

import 'data/constants/enums.dart';
import 'data/model/OrderResponse.dart';
import 'data/model/TokenModel.dart';

// ------------------------\\
// We have deliberately used the least possible number of Dependencies packages
// to ensure that they are compatible with all applications
// and with all versions of flutter that include the update of the Null Safety versions,
// in order to ensure that no problems occur.

class PayMob {
  PayMob._();

  final Remote _remote = Remote(DioHelper());

  ///library [pay_mob] that you can use it for payment with paymob in flutter
  /// For More Details
  /// go to https://docs.paymob.com/docs/
  ///
  /// ---------------------------------------------
  /// Inter this with your actual payment-key && iframe && integrationID that in paymob
  /// You Can Find  https://accept.paymob.com/portal2/en/settings
  ///
  /// ---------------------------------------------
  /// We have deliberately used the least possible number of approved packages
  /// to ensure that they are compatible with all applications and with all versions of Flutter that include the update of the Null Safety,
  /// in order to ensure that no problems occur.
  PayMob.init({
    required String paymentKey,
    required int iframe,
    required int integrationIDCredit,int? integrationIdWallet,
  }) {
    _paymentAuthKey = paymentKey;
    _iFrameCode = iframe;
    _integrationIdCredit = integrationIDCredit;
    _integrationIdWallet = integrationIdWallet??0;
  }

  /// helper Method
  /// TO Get IframeCode From IframeLink
  static int getIframeCodeFromIframeLink(String link) {
    if (link.isEmpty ||
        !(link.contains("https://accept.paymob.com/api/acceptance/iframe/"))) {
      return throw ErrorHint("Invalid Iframe Link");
    } else {
      link = link.split('/')[6].toString();
      if (link.contains("?")) {
        link = link.split("?")[0];
      }
      // after split Operation
      if (link.isEmpty) throw ErrorHint("Invalid Iframe Code In Link");
      return int.parse(link);
    }
  }

  /// Inter this with your actual payment-key that in paymob
  /// You Can Find  https://accept.paymob.com/portal2/en/settings
  ///
  // String get paymentAuthKey => _paymentAuthKey;

  /// Inter this with your actual payment-key that in paymob
  /// You Can Find  https://accept.paymob.com/portal2/en/settings
  ///
  late String _paymentAuthKey;

  /// Inter this with your IframeCode that in paymob
  /// You Can Find  https://accept.paymob.com/portal2/en/settings
  ///  [link Iframe] ex::
  /// 'https://accept.paymob.com/api/acceptance/iframe/435339?token=ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2laWGh3SWpveE5qWTVPREExTmpRM0xDSndhR0Z6YUNJNklqYzJPV05sWXpZNU1tUmhPVFkyT0RjME5qaG1OVEUxTjJVM09UWTBNVEkxTTJOaE5UUXhZalEzWlRWbE5UTmxOVGhqTVRkbU1UUmlZbVkxTkRrMFkyTWlMQ0p3Y205bWFXeGxYM0JySWpveU5EYzBNekY5LmxRQTJnTUlHUWJtSVBKZFdXaWtmZFg0V3plVkk0cUFCOUFXT0VTRkpNUGQ4V2RBT0FtRE1NX1pseTRBdEVOT21ZczRuNVB2OERVRC0zZmhFdEdXQlFR'
  ///   then code is :::  435339
  /// Or Use static function getIframeCodeFromLink(link Iframe as [String])
  late int _iFrameCode;

  //todo write info to get this Id
  late int _integrationIdCredit;
  late int _integrationIdWallet;

  /// this Only method can use for Payment Action
  /// After init Data with init()
  /// take context just for model bottom Sheet && required Order Information as [OrderRequest]
  /// in Error Case return The reason for the failure of the operation at [string] parameter
  /// in Success Case return The Information Data of the operation at  [transactionModel] parameter
  Future checkOut(BuildContext context, {
    required OrderRequest orderRequest,
    required Function(String msg) onError,
    required Function(TransactionModel transactionModel) onSuccess,
    required PaymentType paymentType,
    Widget? loadingWidget,
    String? phone = '',
    Color? defaultBackgroundColor,
  }) async {
    try {
      assert(paymentType == PaymentType.wallet && phone!.isNotEmpty&&_integrationIdWallet != 0,"you should add phone number if you choose wallet and integration_id wallet");
      await _getToken();
      await _order(orderRequest);
      await _payment(paymentType);
      switch (paymentType) {
        case PaymentType.creditCard:
        /// do nothing
          break;
        case PaymentType.wallet:
          await _wallet(phone!);
          break;
      }
      var response = await showModalBottomSheet<dynamic>(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          double height = MediaQuery
              .of(context)
              .size
              .height;
          return DraggableScrollableSheet(
            initialChildSize: 1.0,
            minChildSize: 0.98,
            maxChildSize: 1.0,
            expand: true,
            builder: (_, controller) =>
                SizedBox(
                  height: height,
                  child: ListView(
                    shrinkWrap: true,
                    controller: controller,
                    children: [
                      SizedBox(
                        height: height * 2,
                        child: FlutterPaymentWeb(
                          url : _walletResponse?.iframeRedirectionUrl??"",
                          iframe: _iFrameCode.toString(),
                          token: _paymentKeyResponse.token.toString(),
                          loadingWidget: loadingWidget,
                          backgroundColor: defaultBackgroundColor,
                        ),
                      ),
                    ],
                  ),
                ),
          );
        },
      );
      if (response is TransactionModel) {
        onSuccess(response);
      } else {
        onError(response ?? 'cancel');
      }
    } catch (e, s) {
      Print.error(e, s);
      onError(e.toString());
    }
  }

  late TokenModel _tokenModel;

  /// 1. Authentication Request:-
  /// _________________________________
  /// The Authentication request is an elementary step
  /// you should do before dealing with any of Accept's APIs.
  /// It is a post request with  your [paymentKey] found in your dashboard
  Future<dynamic> _getToken() async {
    return _tokenModel = await _remote.token(_paymentAuthKey);
  }

  late OrderResponse _orderResponse;

  /// Order Registration API:-
  /// _________________________________
  /// At this step, you will register an order to Accept's database,
  ///  so that you can pay for it later using a transaction.
  ///
  /// Order ID will be the identifier that
  /// you will use to link the transaction(s) performed to your system,
  /// as one order can have more than one transaction.
  Future<dynamic> _order(OrderRequest orderRequest) async {
    orderRequest.authToken = _tokenModel.token.toString();
    return _orderResponse = await _remote.order(orderRequest);
  }

  late PaymentKeyResponse _paymentKeyResponse;

  ///3. Payment Key Request
  ///
  /// At this step, you will obtain a payment_key token.
  /// This key will be used to authenticate your payment request.
  /// It will be also used for verifying your transaction request metadata.
  /// return on Sucses [PaymentKeyResponse]
  Future<dynamic> _payment(PaymentType paymentType) async {
    PaymentKeyRequest paymentKeyRequest =
    PaymentKeyRequest.fromOrderResponse(_orderResponse)
      ..authToken = _tokenModel.token
      ..integrationId = paymentType == PaymentType.creditCard?_integrationIdCredit:_integrationIdWallet;

    return _paymentKeyResponse = await _remote.paymentKey(paymentKeyRequest);
  }

  late WalletResponse? _walletResponse;

  Future<dynamic> _wallet(String phone) async {
    return _walletResponse = await _remote.walletMobile(
        phone: phone, token: _paymentKeyResponse.token ?? "");
  }
}
