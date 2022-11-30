library pay_mob;

import 'package:pay_mob/data/model/OrderRequest.dart';
import 'package:pay_mob/data/remote/dio_helper.dart';
import 'package:pay_mob/data/remote/remote.dart';

class PayMob {
  ///library [pay_mob] that you can use it for payment with paymob in flutter
  /// For More Details
  /// go to https://docs.paymob.com/docs/
  PayMob({required this.paymentKey});
  final Remote _remote = Remote(DioHelper());

  // Arbitrary number and used only in this activity. Change it as you wish.
  static const int ACCEPT_PAYMENT_REQUEST = 10;

  /// Inter this with your actual payment-key that in paymob
  /// You Can Find  https://accept.paymob.com/portal2/en/settings
  /// 
  late String paymentKey;

  String expaymentKey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmxlSEFpT2pFMk5Ea3dPREUzTkRNc0ltOXlaR1Z5WDJsa0lqbzBNREkxTXpneE5pd2lZM1Z5Y21WdVkza2lPaUpGUjFBaUxDSnNiMk5yWDI5eVpHVnlYM2RvWlc1ZmNHRnBaQ0k2Wm1Gc2MyVXNJbUpwYkd4cGJtZGZaR0YwWVNJNmV5Sm1hWEp6ZEY5dVlXMWxJam9pUTJ4cFptWnZjbVFpTENKc1lYTjBYMjVoYldVaU9pSk9hV052YkdGeklpd2ljM1J5WldWMElqb2lSWFJvWVc0Z1RHRnVaQ0lzSW1KMWFXeGthVzVuSWpvaU9EQXlPQ0lzSW1ac2IyOXlJam9pTkRJaUxDSmhjR0Z5ZEcxbGJuUWlPaUk0TURNaUxDSmphWFI1SWpvaVNtRnphMjlzYzJ0cFluVnlaMmdpTENKemRHRjBaU0k2SWxWMFlXZ2lMQ0pqYjNWdWRISjVJam9pUTFJaUxDSmxiV0ZwYkNJNkltTnNZWFZrWlhSMFpUQTVRR1Y0WVM1amIyMGlMQ0p3YUc5dVpWOXVkVzFpWlhJaU9pSXJPRFlvT0NrNU1UTTFNakV3TkRnM0lpd2ljRzl6ZEdGc1gyTnZaR1VpT2lJd01UZzVPQ0lzSW1WNGRISmhYMlJsYzJOeWFYQjBhVzl1SWpvaVRrRWlmU3dpZFhObGNsOXBaQ0k2TVRJNU16WXNJbUZ0YjNWdWRGOWpaVzUwY3lJNk1UQXdMQ0p3Yld0ZmFYQWlPaUl4T1RZdU1UVXpMak0wTGpFNU5DSXNJbWx1ZEdWbmNtRjBhVzl1WDJsa0lqb3hPRFk0TlgwLkFzazlYa0U0a1c5VnBOa0NuR1BZekpWaGc4NTFfRjg2a3JabzMyU05ael8xSGlNNVZ6RVBBVC1ScjNjOUs1bHlHNXpsczVPQjhTeUxiVWZPWGNtNjRR";

  /// 1. Authentication Request:-
  /// _________________________________
  /// The Authentication request is an elementary step
  /// you should do before dealing with any of Accept's APIs.
  /// It is a post request with  your [paymentKey] found in your dashboard
  Future<dynamic> getToken() async {
    return _remote.token(paymentKey);
  }

  /// Order Registration API:-
  /// _________________________________
  /// At this step, you will register an order to Accept's database,
  ///  so that you can pay for it later using a transaction.
  ///
  /// Order ID will be the identifier that
  /// you will use to link the transaction(s) performed to your system,
  /// as one order can have more than one transaction.
  Future<dynamic> order(OrderRequest orderRequest) {
    return _remote.order(orderRequest);
  }
}
