import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pay_mob/data/constants/enums.dart';
import 'package:pay_mob/data/model/OrderRequest.dart';
import 'package:pay_mob/data/model/TransactionModel.dart';
//import 'package:pay_mob/paymob_backend.dart';
import 'package:pay_mob/pay_mob.dart';
import 'package:pay_mob/print_types.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  MyHome({Key? key}) : super(key: key);
  String token = '';
  int iframe = 435339;
  final int integrationIdCredit = 2448842;
  final int integrationIdWallet = 3295425;

  final peymentkey = 'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TWpRM05ETXhMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuQmVHR0hLQ1NtN0RoZmVJWTlhNzU1RFRlSXM3T1dJQlZCLTlLVkRYelh0TWpoVDhkaW1tRzdsYW9mWTd3SE5CcWtiYmF4QjFSNFU5eWtMaGxtYXNHV2c=';

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> onTap(BuildContext context) async {
    PayMob payMob = PayMob.init(
      paymentKey: peymentkey,
      iframe:PayMob.getIframeCodeFromIframeLink(
        'https://accept.paymob.com/api/acceptance/iframe/435339?token=ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2laWGh3SWpveE5qWTVPREExTmpRM0xDSndhR0Z6YUNJNklqYzJPV05sWXpZNU1tUmhPVFkyT0RjME5qaG1OVEUxTjJVM09UWTBNVEkxTTJOaE5UUXhZalEzWlRWbE5UTmxOVGhqTVRkbU1UUmlZbVkxTkRrMFkyTWlMQ0p3Y205bWFXeGxYM0JySWpveU5EYzBNekY5LmxRQTJnTUlHUWJtSVBKZFdXaWtmZFg0V3plVkk0cUFCOUFXT0VTRkpNUGQ4V2RBT0FtRE1NX1pseTRBdEVOT21ZczRuNVB2OERVRC0zZmhFdEdXQlFR',
      ),
      integrationIDCredit: integrationIdCredit,
      integrationIdWallet:integrationIdWallet,
    );
    // var data = await payMob.getToken();
    // Print.info('data:: $data');
    // if (data is TokenModel) {
    //   // createOrderWithFakeData
    //   OrderRequest request = createOrderWithFakeData(data);
    //   var d = await payMob.order(request);
    //   Print.info('d::: $d');
    //   if (d is OrderResponse) {
    //     // PaymentKeyRequest paymentKeyRequest =
    //     //     PaymentKeyRequest.fromOrderResponse(d)
    //     //       ..authToken = data.token
    //     //       ..integrationId = 2448842;

    //     var response = await payMob.payment(integrationId: 2448842);
    //     if (response is PaymentKeyResponse) {
    //       setState(() {
    //         token = response.token.toString();
    //       });
    //     }
    //   }
    // }
    OrderRequest request = createOrderWithFakeData();
    payMob.checkOut(context, orderRequest: request, onError: (String msg) {
      Print.warning("error msg:: $msg");
    }, onSuccess: (var map) {
      Print.success(map);
    }, paymentType: PaymentType.creditCard/*,phone: '01010101010'*/);
    /* await payMob.getToken();
    Print.info('data:: ${payMob.tokenModel}');
    //! createOrderWithFakeData

    await payMob.order(request);
    Print.info('d::: ${payMob.orderResponse}');
    var response = await payMob.payment();
    if (response is PaymentKeyResponse) {
      setState(() {
        token = response.token.toString();
      });
    }*/
  }

  OrderRequest createOrderWithFakeData() {
    return OrderRequest(
      amountCents: 3000.toString(),
      // authToken: data.token,
      deliveryNeeded: false.toString(),
      currency: 'EGP',
      merchantOrderId: DateTime.now().microsecondsSinceEpoch,
      //id: 9265545455,
      shippingData: ShippingData(
        email: 'ayman.atef65@yahoo.com',
        apartment: 'apartment',
        building: 'building',
        city: 'الإسكندرية',
        country: 'مصر',
        extraDescription: 'this is the extra description',
        firstName: 'ayman',
        lastName: 'ayman',
        phoneNumber: '01002454688',
        state: 'شارع احمد قمحه',
        postalCode: '1234',
        floor: 'كلية الهندسة ، جامعة الإسكندرية, شارع احمد قمحه, إبراهيمية, الإسكندرية, 21544, مصر',
        street: 'شارع احمد قمحه',
      ),
      items: <Items>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              onTap(context);
            },
            child:  Image.asset('assets/images/png/1.1.png')),
      ),
    );
  }
}
