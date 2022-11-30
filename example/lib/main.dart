import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pay_mob/data/model/OrderRequest.dart';
import 'package:pay_mob/data/model/TokenModel.dart';
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

PayMob payMob = PayMob();

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> onTap() async {
    var data = await payMob.getToken("ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TWpRM05ETXhMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuQmVHR0hLQ1NtN0RoZmVJWTlhNzU1RFRlSXM3T1dJQlZCLTlLVkRYelh0TWpoVDhkaW1tRzdsYW9mWTd3SE5CcWtiYmF4QjFSNFU5eWtMaGxtYXNHV2c=");
   Print.info('data:: $data');
   if(data is TokenModel){
     OrderRequest request = OrderRequest(
       amountCents: 100.toString(),
       authToken: data.token,
       deliveryNeeded: false.toString(),
       currency: 'EGP',
       merchantOrderId: 20,
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
         Items(amountCents: 10.toString(),name: 'label',quantity: 10.toString(),description: 'this is item description')
       ],
     );
     var d = await payMob.order(request);
     Print.info('d::: $d');
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
        body:  Center(
          child: InkWell(
              onTap: onTap,
              child: const Text('Running on: ')),
        ),
      ),
    );
  }
}
