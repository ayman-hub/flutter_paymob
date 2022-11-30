import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:pay_mob/data/model/OrderRequest.dart';
import 'package:pay_mob/data/model/OrderResponse.dart';
import 'package:pay_mob/data/model/TokenModel.dart';
import 'package:pay_mob/print_types.dart';

import 'core.dart';
import 'dio_helper.dart';

class Remote {
  final DioHelper _helper;

  int pageLimit = 7;

  Remote(this._helper);

  Future<dynamic> token(String token) async {
    return _helper.post(path: '/auth/tokens', {"api_key": token},
        onSuccess: (Map<String, dynamic> data) {
      return TokenModel.fromJson(data);
    }, onError: (Map<String, dynamic> data) {
      Print.warning('api error:: $data');
      return data.values.first;
    }, formData: false);
  }

  Future<dynamic> order(OrderRequest orderRequest) async {
    return _helper.post(path: '/ecommerce/orders', orderRequest.toJson(),
        onSuccess: (Map<String, dynamic> data) {
      return OrderResponse.fromJson(data);
    }, onError: (Map<String, dynamic> data) {
      Print.warning('api error:: $data');
      return data.values.first;
    }, formData: false);
  }
}
