import 'package:dio/dio.dart';
import 'package:pay_mob/print_types.dart';

class DioExceptions implements Exception {


  DioExceptions.fromDioError(DioError dioError) {
    Print.warning(dioError.toString());
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        try{
          message = _handleError(dioError.response!.statusCode, dioError.response?.data ?? {});
        }catch(e,s){
          message = _handleError(
              dioError.response!.statusCode,{
                "msg": 'server error happen please contact developer'
          });
          Print.error(e.toString(),s);
        }
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  late String message;
  String? code;
  String? phone;

  String _handleError(int? statusCode, dynamic error) {
    Print.warning('error:::: ${error.toString()}');
    switch (statusCode) {
      case 401:
        return 'error status code 401';
      case 400:
        print('status code :: 400');
        return 'Bad request';
      case 404:
        print('status code :: 404 ${error['msg']}');
        return '${error["msg"]}';
      case 422:
        Print.warning('status code :: 422 ${error['msg']}');
        try{
          code = error['data']['code']??'12345';
          phone = error['data']['phone'];
        }catch(e,s){
          Print.error(e.toString(), s);
        }
        return '${error["msg"]}';
      case 500:
        print('status code :: 500');
        return 'server error';
      default:
        return 'server error';
    }
  }

  @override
  String toString() => message;
}
