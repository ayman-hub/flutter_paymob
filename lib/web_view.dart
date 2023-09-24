import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'data/model/TransactionModel.dart';
import 'print_types.dart';

class FlutterPaymentWeb extends StatefulWidget {
  FlutterPaymentWeb(
      {this.token =
          "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SnZjbVJsY2w5cFpDSTZPRE01TURneE56QXNJbVY0ZEhKaElqcDdmU3dpY0cxclgybHdJam9pTVRrM0xqRXpNeTQ0T1M0eU5URWlMQ0pzYjJOclgyOXlaR1Z5WDNkb1pXNWZjR0ZwWkNJNlptRnNjMlVzSW1GdGIzVnVkRjlqWlc1MGN5STZNVEF3TENKaWFXeHNhVzVuWDJSaGRHRWlPbnNpWm1seWMzUmZibUZ0WlNJNkltRjViV0Z1SWl3aWJHRnpkRjl1WVcxbElqb2lZWFJsWmlJc0luTjBjbVZsZENJNkluTjBjbVZsZENJc0ltSjFhV3hrYVc1bklqb2lZblZwYkdScGJtY2lMQ0ptYkc5dmNpSTZJbVpzYjI5eUlpd2lZWEJoY25SdFpXNTBJam9pWVhCaGNuUnRaVzUwSWl3aVkybDBlU0k2SW1OaGFYSnZJaXdpYzNSaGRHVWlPaUp6ZEhKbFpYUWlMQ0pqYjNWdWRISjVJam9pWldkNWNIUWlMQ0psYldGcGJDSTZJbUY1YldGdUxtRjBaV1kyTlVCNVlXaHZieTVqYjIwaUxDSndhRzl1WlY5dWRXMWlaWElpT2lJd01UQXdNalExTkRZNE9DSXNJbkJ2YzNSaGJGOWpiMlJsSWpvaU1qRXpOVFFpTENKbGVIUnlZVjlrWlhOamNtbHdkR2x2YmlJNklrNUJJbjBzSW1OMWNuSmxibU41SWpvaVJVZFFJaXdpWlhod0lqb3hOalk1T0RBMk5qRTFMQ0pwYm5SbFozSmhkR2x2Ymw5cFpDSTZNalEwT0RnME1pd2ljMmx1WjJ4bFgzQmhlVzFsYm5SZllYUjBaVzF3ZENJNlptRnNjMlVzSW5WelpYSmZhV1FpT2pRME1UTTFObjAuSXo3dWt5eGJxSTlja21zSTV0MlUtVzJFdVItSHFVWWNDRXdCbVJhb18yY25iXzAtTl9lS0pTNmlTeHcyaEdRR0pYSXM5SGo3WXd0TDhOZnJFN2dqVGc=",
      this.iframe = "435339",
      Key? key,
      this.loadingWidget,
      this.backgroundColor,
      this.url,
      this.parameter})
      : super(key: key);
  String token;
  String iframe;
  String? url;
  Widget? loadingWidget;
  Color? backgroundColor;
  String? parameter;

  @override
  State<FlutterPaymentWeb> createState() => _FlutterPaymentWebState();
}

class _FlutterPaymentWebState extends State<FlutterPaymentWeb> {
  bool isLoading = true;
  bool showProgress = true;
  double progress = 0.0;

  WebViewController controller = WebViewController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    String url = widget.url ??
        'https://accept.paymobsolutions.com/api/acceptance/iframes/${widget.iframe}?payment_token=${widget.token}';
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(widget.backgroundColor ?? const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(onProgress: (int value) {
          Print.info('WebView is loading (progress : $value%)');
          setState(() {
            if (value >= 99) {
              showProgress = false;
            } else {
              showProgress = true;
            }
            progress = value.toDouble();
          });
        }, onPageStarted: (String url) {
          Print.info('Page started loading: $url');
        }, onPageFinished: (String url) {
          Print.info('Page finished loading: $url');
          Future.delayed(const Duration(milliseconds: 500), () {});
          setState(() {
            isLoading = false;
          });
        }, onWebResourceError: (WebResourceError error) {
          Print.warning(error.url);
          Print.error(error.description, StackTrace.current);
        }, onNavigationRequest: (NavigationRequest request) {
          Print.info('request::${request.toString()}');
          if (request.url.contains(widget.parameter ?? 'status') ?? false) {
            try {
              Print.info('request inside status ::${request.toString()}');
              Navigator.pop(
                  context, Uri.tryParse(request.url ?? "")?.queryParameters);
            } catch (e, s) {
              Print.error(e, s);
            }
            // return NavigationDecision.prevent;
          }
          Print.info('allowing navigation to $request');
          return NavigationDecision.navigate;
        }),
      )
      ..loadRequest(Uri.parse(url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          isLoading ? progressWidget() : Container()
        ],
      ),
    );
  }

  Widget progressWidget() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress / 100,
            strokeWidth: 5,
            backgroundColor: Colors.white,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          Text(
            '$progress%',
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
