import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:online_astro24/utils/setup.dart';


class ApiBaseHelper {

  _authFailure(){

  }

  Future<dynamic> get(String url) async {
    var responseJson;
    final response = await http.get(Uri.parse(aPPmAINuRL + url));
    responseJson = _returnResponse(response);
    print("==="+jsonEncode(responseJson));
    try {

    } catch(e){
      responseJson = null;
    }
    return responseJson;
  }

  Future<dynamic> post(String url,Map reqBody) async {
    var responseJson;

    final response = await http.post(aPPmAINuRL + url ,body: jsonEncode(reqBody),headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    responseJson = _returnResponse(response);
    return  responseJson;
  }

  dynamic _returnResponse(http. Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        _authFailure();
        return null;
      default:
        return null;
    }
  }

}
