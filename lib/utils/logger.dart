import 'package:logger/logger.dart';

const String _tag = "easy_tab_controller";

var _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, //展示方法调用数
    errorMethodCount: 8,
    lineLength: 120,
    colors: true, // 丰富多彩的日志消息
    printEmojis: true, // 为每条日志消息打印一个表情符号
    printTime: false, // 每个日志打印是否应包含时间戳
  ),
);


logV(String msg) {
  _logger.v("$_tag :: $msg");
}

logD(String msg) {
  _logger.d("$_tag :: $msg");
}

logI(String msg) {
  _logger.i("$_tag :: $msg");
}

logW(String msg) {
  _logger.w("$_tag :: $msg");
}

logE(String msg) {
  _logger.e("$_tag :: $msg");
}

logWTF(String msg) {
  _logger.wtf("$_tag :: $msg");
}
