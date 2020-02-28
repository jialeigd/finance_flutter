///错误编码
class SHFHttpCode {
  ///网络错误
  static const SHF_NETWORK_ERROR = -1;

  ///网络超时
  static const SHF_NETWORK_TIMEOUT = -2;

  ///网络返回数据格式化一次
  static const SHF_NETWORK_JSON_EXCEPTION = -3;

  static const SHF_SUCCESS = 200;

  static errorHandleFunction(code, message, noTip) {
    if(noTip) {
      return message;
    }

    return message;
  }
}