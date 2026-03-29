import 'package:dio/dio.dart';
import 'package:pay_mob/print_types.dart';

class DioExceptions<T> implements Exception {
  DioExceptions.fromDioError(DioException dioError) {
    sPrint.warning(dioError.toString());
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.unknown:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response!.statusCode,
          dioError.response?.data ?? {},
        );
        break;
      case DioExceptionType.sendTimeout:
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
    sPrint.error("error:$statusCode: $error ", StackTrace.current);

    switch (statusCode) {
      case 401:
        sPrint.warning('401 authenticated');
        return error['msg']?.toString() ??
            error['error']?.toString() ??
            'يجب تسجيل الدخول اولأ';
      case 400:
        return error['msg']?.toString() ??
            error['error']?.toString() ??
            'Bad request';
      case 404:
        return error['msg']?.toString() ?? "";
      case 405:
        return error['msg'] ?? error['error'] ?? "method not allowed";
      case 422:
        try {
          sPrint.warning('status code :: 422 ${error['error']}');
          if ((error as Map).containsKey('msg')) {
            return error['msg'];
          }
          if (error is Map<String, dynamic>) {
            if (error['error'] != null) {
              Map<String, dynamic> errors = error['error'];
              String value = errors.values.map((e) {
                if (e is List) {
                  return e.map((b) => "error: $b").join(" \n ");
                } else {
                  return "error: $e";
                }
              }).join(" \n ");
              message = value;
            }
          }
        } catch (e, s) {
          sPrint.error(e.toString(), s);
        }
        return '${error["error"]}';
      case 500:
        return "Internal Server Error";
      default:
        return "Something went wrong";
    }
  }

  @override
  String toString() => toString();
}
