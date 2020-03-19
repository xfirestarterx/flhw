import 'package:fl02/custom_list_tile.dart';
import 'package:fl02/services/http_service.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';

class SecondScreen extends StatelessWidget {
  final httpService = new HttpService();

  @override
  build(BuildContext ctx) {
    return Scaffold(
      body: Container(
        color: Colors.blue[700],
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: FutureBuilder(
            future: httpService.getUsers(),
            builder: (BuildContext ctx, AsyncSnapshot<List<User>> snapshot) {
              if (snapshot.hasData) {
                List<User> users = snapshot.data;

                return ListView(
                  children: _usersListView(users, ctx),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  List<CustomListTile> _usersListView(List<User> users, BuildContext ctx) {
    return users.map((User user) => _getListTile(user, ctx)).toList();
  }

  CustomListTile _getListTile(User user, BuildContext ctx) {
    return CustomListTile(
      title: user.name,
      subtitle: user.email,
      onTap: () => Navigator.of(ctx).pop(user),
    );
  }
}
