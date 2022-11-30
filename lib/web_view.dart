import 'package:flutter/material.dart';
import 'package:pay_mob/data/model/TransactionModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'print_types.dart';

class FlutterPaymentWeb extends StatelessWidget {
  FlutterPaymentWeb({this.token ="ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SnZjbVJsY2w5cFpDSTZPRE01TURneE56QXNJbVY0ZEhKaElqcDdmU3dpY0cxclgybHdJam9pTVRrM0xqRXpNeTQ0T1M0eU5URWlMQ0pzYjJOclgyOXlaR1Z5WDNkb1pXNWZjR0ZwWkNJNlptRnNjMlVzSW1GdGIzVnVkRjlqWlc1MGN5STZNVEF3TENKaWFXeHNhVzVuWDJSaGRHRWlPbnNpWm1seWMzUmZibUZ0WlNJNkltRjViV0Z1SWl3aWJHRnpkRjl1WVcxbElqb2lZWFJsWmlJc0luTjBjbVZsZENJNkluTjBjbVZsZENJc0ltSjFhV3hrYVc1bklqb2lZblZwYkdScGJtY2lMQ0ptYkc5dmNpSTZJbVpzYjI5eUlpd2lZWEJoY25SdFpXNTBJam9pWVhCaGNuUnRaVzUwSWl3aVkybDBlU0k2SW1OaGFYSnZJaXdpYzNSaGRHVWlPaUp6ZEhKbFpYUWlMQ0pqYjNWdWRISjVJam9pWldkNWNIUWlMQ0psYldGcGJDSTZJbUY1YldGdUxtRjBaV1kyTlVCNVlXaHZieTVqYjIwaUxDSndhRzl1WlY5dWRXMWlaWElpT2lJd01UQXdNalExTkRZNE9DSXNJbkJ2YzNSaGJGOWpiMlJsSWpvaU1qRXpOVFFpTENKbGVIUnlZVjlrWlhOamNtbHdkR2x2YmlJNklrNUJJbjBzSW1OMWNuSmxibU41SWpvaVJVZFFJaXdpWlhod0lqb3hOalk1T0RBMk5qRTFMQ0pwYm5SbFozSmhkR2x2Ymw5cFpDSTZNalEwT0RnME1pd2ljMmx1WjJ4bFgzQmhlVzFsYm5SZllYUjBaVzF3ZENJNlptRnNjMlVzSW5WelpYSmZhV1FpT2pRME1UTTFObjAuSXo3dWt5eGJxSTlja21zSTV0MlUtVzJFdVItSHFVWWNDRXdCbVJhb18yY25iXzAtTl9lS0pTNmlTeHcyaEdRR0pYSXM5SGo3WXd0TDhOZnJFN2dqVGc=" , this.iframe = "435339",Key? key}) : super(key: key);
  String token;
  String iframe;
  @override
  Widget build(BuildContext context) {
    String url1 ='https://accept.paymob.com/api/acceptance/iframe/435339?token=ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2laWGh3SWpveE5qWTVPREExTmpRM0xDSndhR0Z6YUNJNklqYzJPV05sWXpZNU1tUmhPVFkyT0RjME5qaG1OVEUxTjJVM09UWTBNVEkxTTJOaE5UUXhZalEzWlRWbE5UTmxOVGhqTVRkbU1UUmlZbVkxTkRrMFkyTWlMQ0p3Y205bWFXeGxYM0JySWpveU5EYzBNekY5LmxRQTJnTUlHUWJtSVBKZFdXaWtmZFg0V3plVkk0cUFCOUFXT0VTRkpNUGQ4V2RBT0FtRE1NX1pseTRBdEVOT21ZczRuNVB2OERVRC0zZmhFdEdXQlFR';// 'https://accept.paymob.com/api/acceptance/iframe/$iframe?token=$token';
    String url =  'https://accept.paymobsolutions.com/api/acceptance/iframes/$iframe?payment_token=$token';
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      allowsInlineMediaPlayback: true,
      debuggingEnabled: true,
      onProgress: (int progress) {
        Print.info('WebView is loading (progress : $progress%)');
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.contains('updated')) {
          try{
            TransactionModel transactionModel = TransactionModel.fromJson(Uri.tryParse(request.url)?.queryParameters);
         Print.info('transaction data:: ${transactionModel.toJson()}');
          }catch(e,s){
            Print.error(e, s);
          }
          return NavigationDecision.prevent;
        }
        Print.info('allowing navigation to $request');
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {
        Print.info('Page started loading: $url');
      },
      onPageFinished: (String url) {
        Print.info('Page finished loading: $url');
      },
      gestureNavigationEnabled: true,
      backgroundColor: const Color(0x00000000),
    );
  }
}

