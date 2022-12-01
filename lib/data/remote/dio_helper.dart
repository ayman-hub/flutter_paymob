import 'dart:convert';

import 'package:dio/dio.dart';

import '../../print_types.dart';
import '../constants/const_Strings.dart';
import '../error/dio_exception.dart';
import 'core.dart';

const String MSG = 'msg';
const String STATUS = 'status';
const String CODE = 'code';
const String NEED_LOGIN = 'needLogin';
const String PHONE = 'phone';

class DioHelper {
  late Response _response;
  final Dio _dio = Dio();

  Future<dynamic> get(
    Map<String, dynamic> post, {
    String path = '',
    bool isHtml = false,
    required Function(dynamic) onSuccess,
    required Function(Map<String, dynamic> data) onError,
    bool isLogin = false,
  }) async {
    try {
      _dio.options.connectTimeout = CustomConst.connectTimeout; //5s
      _dio.options.receiveTimeout = CustomConst.connectTimeout;
      Map<String, dynamic> query = {};
      query.addAll(post);
      Print.info('start $post');
      Print.info('link ${checkValidPath(path)}');
      _response = await _dio.get(
        checkValidPath(path),
        queryParameters: query,
        onReceiveProgress: showProgress,
        options: Options(
          headers: {
            CustomConst.ContentTypeKey: CustomConst.ContentTypeValue,
          },
        ),
      );
      if (_response.statusCode == 200 || _response.statusCode == 201) {
        if (_response.data is String) {
          if (!isHtml) {
            _response.data =
                jsonDecode(_response.data.toString().replaceAll("\/", '/'));
          } else {
            return onSuccess(
                _response.data.toString().replaceAll('<!doctype html>', ''));
          }
        }
        Print.success("response in dio: ${_response.data}");
        return onSuccess(_response.data);
      } else {
        return _response.data.toString();
      }
    } catch (error, s) {
      if (error.toString() == NEED_LOGIN) {
        return onError({MSG: error.toString(), STATUS: 2});
      }
      String msg = '';
      String? code;
      String phone = '';
      Print.error(s.toString(), s);
      if (error is DioError) {
        DioExceptions dioExceptions = DioExceptions.fromDioError(error);
        msg = dioExceptions.message.toString();
        code = dioExceptions.code;
        phone = dioExceptions.phone.toString();
      } else {
        msg = error.toString();
      }
      return onError({MSG: msg, STATUS: 0, CODE: code, PHONE: phone});
    }
  }

  String checkValidPath(String path) =>
      path.contains('http') ? path : apiUrl() + path;

  Future<dynamic> post(
    Map<String, dynamic> post, {
    required Function(Map<String, dynamic> data) onSuccess,
    required Function(Map<String, dynamic> data) onError,
    Map<String, dynamic>? headers,
    isLogin = false,
    bool formData = true,
    String path = '',
  }) async {
    try {
      _dio.options.connectTimeout = CustomConst.connectTimeout; //5s
      _dio.options.receiveTimeout = CustomConst.connectTimeout;
      Print.info('start $post');
      Print.info('link ${checkValidPath(path)}');
      _response = await _dio.post(
        checkValidPath(path),
        data: formData ? FormData.fromMap(post) : post,
        queryParameters: {},
        onReceiveProgress: showProgress,
        options: Options(
          headers: {
            CustomConst.ContentTypeKey: CustomConst.ContentTypeValue,
            //if (isLogin)'Authorization': 'Bearer ${loginModel.data!.token}',
            ...headers ?? {}
          },
        ),
      );
      if (_response.statusCode == 200 || _response.statusCode == 201) {
        if (_response.data is String) {
          _response.data = jsonDecode(_response.data);
        }
        Print.success(
            "response in dio ${_response.data.runtimeType}: ${_response.data}");
        return onSuccess(_response.data);
      } else {
        return _response.data.toString();
      }
    } catch (error, s) {
      String msg = '';
      String? code;
      String phone = '';
      Print.warning(error);
      if (error is DioError) {
      /*  DioExceptions dioExceptions = DioExceptions.fromDioError(error);
        msg = dioExceptions.message.toString();*/
        return onError({MSG: error.response?.data});
      } else {
        Print.error(error.toString(), s);
        msg = error.toString();
      }
      Print.warning(msg);
      return onError({MSG: error});
    }
  }

  void showProgress(received, total) {
    if (total != -1) {
      String progress = (received / total * 100).toStringAsFixed(0) + "%";
      Print.info(progress);
    }
  }
}
