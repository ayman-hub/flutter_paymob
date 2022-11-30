import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pay_mob/data/model/OrderRequest.dart';
import 'package:pay_mob/data/model/OrderResponse.dart';
import 'package:pay_mob/data/model/PaymentKeyRequest.dart';
import 'package:pay_mob/data/model/PaymentKeyResponse.dart';
import 'package:pay_mob/data/model/TokenModel.dart';
import 'package:pay_mob/pay_mob.dart';
import 'package:pay_mob/print_types.dart';
import 'package:pay_mob/web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  PayMob payMob = PayMob(paymentKey: "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TWpRM05ETXhMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuQmVHR0hLQ1NtN0RoZmVJWTlhNzU1RFRlSXM3T1dJQlZCLTlLVkRYelh0TWpoVDhkaW1tRzdsYW9mWTd3SE5CcWtiYmF4QjFSNFU5eWtMaGxtYXNHV2c=");
  String token = '';
  int iframe = 435339;

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> onTap() async {
    var data = await payMob.getToken();
    Print.info('data:: $data');
    if (data is TokenModel) {
      OrderRequest request = OrderRequest(
        amountCents: 1.toString(),
        authToken: data.token,
        deliveryNeeded: false.toString(),
        currency: 'EGP',
        merchantOrderId: DateTime
            .now()
            .microsecond,
        shippingData: ShippingData(
          email: 'ayman.atef65@yahoo.com',
          apartment: 'apartment',
          building: 'building',
          city: 'cairo',
          country: 'egypt',
          extraDescription: 'this is the extra description',
          firstName: 'ayman',
          lastName: 'atef',
          phoneNumber: '01002454688',
          state: 'street',
          postalCode: '21354',
          floor: 'floor',
          street: 'street',
        ),
        items: <Items>[
          Items(amountCents: 1,
              name: 'label',
              quantity: 1,
              description: 'this is item description')
        ],
      );
      var d = await payMob.order(request);
      Print.info('d::: $d');
      if (d is OrderResponse) {
        PaymentKeyRequest paymentKeyRequest = PaymentKeyRequest
            .fromOrderResponse(d);
        paymentKeyRequest.authToken = data.token;
        paymentKeyRequest.integrationId = 2448842;

        var response = await payMob.payment(paymentKeyRequest);
        if (response is PaymentKeyResponse) {
          setState(() {
            token = response.token.toString();
          });
        }
      }
    }
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.


    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: token.isNotEmpty
            ? FlutterPaymentWeb(token: token, iframe: iframe.toString())
            : Center(
                child: InkWell(onTap: onTap, child: const Text('Running on: ')),
              ),
      ),
    );
  }
}
