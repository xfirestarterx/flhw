import 'dart:convert';
import 'package:http/http.dart';
import 'package:fl02/models/user.dart';

class HttpService {
  static const BASE_URL = 'https://jsonplaceholder.typicode.com';

  Future<List<User>> getUsers() async {
    Response resp = await get('$BASE_URL/users');

    if (resp.statusCode != 200) {
      throw "Unable to get users";
    } else {
      final List<dynamic> body = jsonDecode(resp.body);

      List<User> users =
          body.map((item) => User.fromJSON(item)).toList();

      return users;
    }
  }
}
