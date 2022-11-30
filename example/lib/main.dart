import 'package:flutter/material.dart';
import 'dart:async';

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
  PayMob payMob = PayMob(
    paymentKey:
        "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmxlSEFpT2pFMk5Ea3dPREUzTkRNc0ltOXlaR1Z5WDJsa0lqbzBNREkxTXpneE5pd2lZM1Z5Y21WdVkza2lPaUpGUjFBaUxDSnNiMk5yWDI5eVpHVnlYM2RvWlc1ZmNHRnBaQ0k2Wm1Gc2MyVXNJbUpwYkd4cGJtZGZaR0YwWVNJNmV5Sm1hWEp6ZEY5dVlXMWxJam9pUTJ4cFptWnZjbVFpTENKc1lYTjBYMjVoYldVaU9pSk9hV052YkdGeklpd2ljM1J5WldWMElqb2lSWFJvWVc0Z1RHRnVaQ0lzSW1KMWFXeGthVzVuSWpvaU9EQXlPQ0lzSW1ac2IyOXlJam9pTkRJaUxDSmhjR0Z5ZEcxbGJuUWlPaUk0TURNaUxDSmphWFI1SWpvaVNtRnphMjlzYzJ0cFluVnlaMmdpTENKemRHRjBaU0k2SWxWMFlXZ2lMQ0pqYjNWdWRISjVJam9pUTFJaUxDSmxiV0ZwYkNJNkltTnNZWFZrWlhSMFpUQTVRR1Y0WVM1amIyMGlMQ0p3YUc5dVpWOXVkVzFpWlhJaU9pSXJPRFlvT0NrNU1UTTFNakV3TkRnM0lpd2ljRzl6ZEdGc1gyTnZaR1VpT2lJd01UZzVPQ0lzSW1WNGRISmhYMlJsYzJOeWFYQjBhVzl1SWpvaVRrRWlmU3dpZFhObGNsOXBaQ0k2TVRJNU16WXNJbUZ0YjNWdWRGOWpaVzUwY3lJNk1UQXdMQ0p3Yld0ZmFYQWlPaUl4T1RZdU1UVXpMak0wTGpFNU5DSXNJbWx1ZEdWbmNtRjBhVzl1WDJsa0lqb3hPRFk0TlgwLkFzazlYa0U0a1c5VnBOa0NuR1BZekpWaGc4NTFfRjg2a3JabzMyU05ael8xSGlNNVZ6RVBBVC1ScjNjOUs1bHlHNXpsczVPQjhTeUxiVWZPWGNtNjRR",
  );

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
          Items(
              amountCents: 10.toString(),
              name: 'label',
              quantity: 10.toString(),
              description: 'this is item description')
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
        body: Center(
          child: InkWell(onTap: onTap, child: const Text('Running on: ')),
        ),
      ),
    );
  }
}
