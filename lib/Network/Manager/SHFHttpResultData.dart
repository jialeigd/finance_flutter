class SHFHttpResultData {
  var data;
  bool isSuccess;
  int code;
  var headers;

  SHFHttpResultData(this.data, this.isSuccess, this.code, {this.headers});
}