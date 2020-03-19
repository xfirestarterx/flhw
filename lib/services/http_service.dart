import 'dart:convert';
import 'package:http/http.dart';
import 'package:fl02/models/user.dart';

class HttpService {
  static const _url = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> getUsers() async {
    Response resp = await get(_url);

    if (resp.statusCode != 200) {
      throw "Unable to get users";
    } else {
      final List<dynamic> body = jsonDecode(resp.body);

      List<User> users =
          body.map((dynamic item) => User.fromJSON(item)).toList();

      return users;
    }
  }
}
