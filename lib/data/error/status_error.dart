/*


enum StatusType { apiError, apiSuccess, authError, none }

class StatusError {
  StatusType _getStatus(int status) {
    switch (status) {
      case 0:
        return StatusType.apiError;
      case 1:
        return StatusType.apiSuccess;
      case 2:
        return StatusType.authError;
      default:
        return StatusType.none;
    }
  }

  checkStatus(dynamic data, Function onSuccess, {Function(String)? onError,bool isShowToast = true}) {
    switch (_getStatus(data.status)) {
      case StatusType.apiError:
        Print.warning(
          data!.msg.toString(),
        );
        if(isShowToast){
          showToast('${data!.msg}', MessageErrorType.error);
        }
        */
/*if(data!.msg.toString().toLowerCase().contains('لايوجد')){
          Print.success('get Success');
          return  onSuccess.call();
        }else*//*

        if (onError != null) {
        return  onError.call(data!.msg);
        }
        break;
      case StatusType.apiSuccess:
        Print.success('get Success');
      return  onSuccess.call();
        break;
      case StatusType.authError:
        // TODO: Handle this case.
        showToast('need to login first', MessageErrorType.error);
        break;
      case StatusType.none:
        // TODO: Handle this case.
        break;
    }
  }
}

*/
