import 'dart:convert';
import 'package:http/http.dart' as http;


Future<void> getData ()async
{
  final response = await http.get("https://api.github.com/users/jaituteja");
  print(response.body);
  print(response.statusCode);

  var res = jsonDecode(response.body);
  print(res["login"]);

}

