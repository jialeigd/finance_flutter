import 'dart:collection';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';


class DataHelper{

  static SplayTreeMap getBaseMap() {
    var map = new SplayTreeMap<String, dynamic>();
    map["appName"] = "2";
    map["sourceType"] = "1";
    map["appVersion"] = "3.10.13";
    map["timestamp"] = new DateTime.now().millisecondsSinceEpoch.toString();;
    map["did"] = "cd3803e9530f27848591b2646372fc86";
    map["os"] = "2";


    return map;
  }

  static string2MD5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}