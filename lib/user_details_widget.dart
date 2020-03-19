import 'package:fl02/models/user.dart';
import 'package:flutter/material.dart';

Widget userDetailsWidget(User user) {
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    child: DefaultTextStyle(
      style: TextStyle(
        color: Colors.white,
        height: 1.8,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Name: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(user.name),
            ],
          ),
          Text('Email: ${user.email}'),
          Text('Full name: ${user.name}'),
          Text('Phone: ${user.phone}'),
          Text('Website: ${user.website}'),
        ],
      ),
    ),
  );
}
