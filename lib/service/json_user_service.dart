import 'package:eticaretapp/model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Service {
  static const url = "https://jsonplaceholder.typicode.com/users";
  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<User> list = parseUsers(response.body);
        return list;
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<User> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}
