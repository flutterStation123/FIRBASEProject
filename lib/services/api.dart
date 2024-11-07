import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class ApiServices {
  getRequest() async {
    var res = await get(Uri.parse("https://jsonplaceholder.typicode.com/posts/3"));
    var decodeData = json.decode(res.body);
    print(decodeData);
  }
}