import 'dart:developer';

/*
* this is all type of color
* Black:   \x1B[30m
  Red:     \x1B[31m
  Green:   \x1B[32m
  Yellow:  \x1B[33m
  Blue:    \x1B[34m
  Magenta: \x1B[35m
  Cyan:    \x1B[36m
  White:   \x1B[37m
  Reset:   \x1B[0m

📕: error message
📙: warning message
📗: ok status message
📘: action message
📓: canceled status message
📔: Or anything you like and want to recognize immediately by color
  *
  *
*/
class sPrint {
  static warning(msg) {
    log(" $msg", name: 'WARNING 📙:');
    //   print("📙: \x1B[33m $msg \x1B[0m");
  }

  static info(msg) {
    log('$msg', name: 'INFO 📘: ');
    //print('📘: \x1B[34m   $msg  \x1B[0m');
  }

  static success(msg) {
    log(' $msg', name: 'SUCCESS 📗:');
    //  print('📗: \x1B[32m   $msg  \x1B[0m');
  }

  static error(msg, StackTrace stackTrace) {
    log(msg.toString(), name: 'ERROR 📕:', stackTrace: stackTrace);
  }
}
