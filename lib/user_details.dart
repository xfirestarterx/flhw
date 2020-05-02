import 'package:fl02/models/user.dart';
import 'package:flutter/material.dart';

import 'l10n.dart';

class UserDetails extends StatelessWidget {
  final User user;

  UserDetails(this.user);

  @override
  build(BuildContext ctx) {
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
                '${CustomLocalizations.of(ctx).name}: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(user.name),
            ],
          ),
          Text('${CustomLocalizations.of(ctx).email}: ${user.email}'),
          Text('${CustomLocalizations.of(ctx).fullName}: ${user.name}'),
          Text('${CustomLocalizations.of(ctx).phone}: ${user.phone}'),
          Text('${CustomLocalizations.of(ctx).website}: ${user.website}'),
        ],
      ),
    ),
  );
  }
}
