import 'package:pay_mob/data/constants/const_Strings.dart';
import 'package:pay_mob/data/model/OrderRequest.dart';
import 'package:pay_mob/data/model/OrderResponse.dart';
import 'package:pay_mob/data/model/TokenModel.dart';
import 'package:pay_mob/print_types.dart';

import 'dio_helper.dart';

class Remote {
  final DioHelper _helper;

  Remote(this._helper);

  Future<dynamic> token(String token) async {
    return _helper.post(path: CustomConst.Authentication, {
      CustomConst.Api_Key: token,
    }, onSuccess: (Map<String, dynamic> data) {
      return TokenModel.fromJson(data);
    }, onError: (Map<String, dynamic> data) {
      Print.warning(' ${CustomConst.ApiErrorWord} $data');
      return data.values.first;
    }, formData: false);
  }

  Future<dynamic> order(OrderRequest orderRequest) async {
    return _helper.post(
      path: CustomConst.OrderRegistration,
      orderRequest.toJson(),
      onSuccess: (Map<String, dynamic> data) {
        return OrderResponse.fromJson(data);
      },
      onError: (Map<String, dynamic> data) {
        Print.warning('${CustomConst.ApiErrorWord} $data');
        return data.values.first;
      },
      formData: false,
    );
  }
}
