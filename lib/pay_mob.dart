library pay_mob;

import 'package:pay_mob/data/model/OrderRequest.dart';
import 'package:pay_mob/data/model/PaymentKeyRequest.dart';
import 'package:pay_mob/data/remote/dio_helper.dart';
import 'package:pay_mob/data/remote/remote.dart';

import 'data/model/OrderResponse.dart';
import 'data/model/TokenModel.dart';

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
  PayMob.init({
    required String paymentKey,
    required int iframe,
    required int integrationID,
  }) {
    _paymentAuthKey = paymentKey;
    _iFrameCode = iframe;
    _integrationId = integrationID;
  }

  // Arbitrary number and used only in this activity. Change it as you wish.
  static const int ACCEPT_PAYMENT_REQUEST = 10;

  /// Inter this with your actual payment-key that in paymob
  /// You Can Find  https://accept.paymob.com/portal2/en/settings
  ///
  String get paymentAuthKey => _paymentAuthKey;

  /// Inter this with your actual payment-key that in paymob
  /// You Can Find  https://accept.paymob.com/portal2/en/settings
  ///
  late String _paymentAuthKey;

  set paymentAuthKey(String value) {
    _paymentAuthKey = value;
  }

  /// Inter this with your IframeCode that in paymob
  /// You Can Find  https://accept.paymob.com/portal2/en/settings
  ///
  late int _iFrameCode;
  int get iFrameCode => _iFrameCode;
  set iFrameCode(int value) {
    _iFrameCode = value;
  }

  /// Inter this with your IframeCode that in paymob
  /// You Can Find  https://accept.paymob.com/portal2/en/settings
  ///
  late int _integrationId;
  int get integrationId => _integrationId;
  set integrationId(int value) {
    _integrationId = value;
  }

  late OrderResponse _orderResponse;
  // just for debug at this moment
  OrderResponse get orderResponse => _orderResponse;

  set orderResponse(OrderResponse value) {
    _orderResponse = value;
  }

  late TokenModel _tokenModel;
  // just for debug at this moment
  TokenModel get tokenModel => _tokenModel;
  set tokenModel(TokenModel value) {
    _tokenModel = value;
  }

  /// 1. Authentication Request:-
  /// _________________________________
  /// The Authentication request is an elementary step
  /// you should do before dealing with any of Accept's APIs.
  /// It is a post request with  your [paymentKey] found in your dashboard
  Future<dynamic> getToken() async {
    return tokenModel = await _remote.token(paymentAuthKey);
  }

  /// Order Registration API:-
  /// _________________________________
  /// At this step, you will register an order to Accept's database,
  ///  so that you can pay for it later using a transaction.
  ///
  /// Order ID will be the identifier that
  /// you will use to link the transaction(s) performed to your system,
  /// as one order can have more than one transaction.
  Future<dynamic> order(OrderRequest orderRequest) async {
    return orderResponse = await _remote.order(orderRequest);
  }

  ///3. Payment Key Request
  ///
  /// At this step, you will obtain a payment_key token.
  /// This key will be used to authenticate your payment request.
  /// It will be also used for verifying your transaction request metadata.
  /// return on Sucses [PaymentKeyResponse]
  Future<dynamic> payment() {
    PaymentKeyRequest paymentKeyRequest =
        PaymentKeyRequest.fromOrderResponse(_orderResponse)
          ..authToken = _tokenModel.token
          ..integrationId = integrationId;

    return _remote.paymentKey(paymentKeyRequest);
  }
}
