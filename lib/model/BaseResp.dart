import 'dart:convert' show json;


class BaseResp<T> {
  T data;
  String msg;
  int code;

  factory BaseResp(jsonStr, Function buildFun) =>
      jsonStr is String ? BaseResp.fromJson(json.decode(jsonStr), buildFun) : BaseResp.fromJson(jsonStr, buildFun);

  BaseResp.fromJson(jsonRes, Function buildFun) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = buildFun(jsonRes['object']);
  }
}
