// ignore_for_file: prefer_const_constructors, implementation_imports, unnecessary_import, unused_import, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unnecessary_null_comparison, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, override_on_non_overriding_member

import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/provider/users.dart';
import 'package:crud_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  UserTile(this.user);

  @override
  ListTile build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
              color: Colors.orange,
              icon: Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                      title: Text('Excluir Usuário'),
                      content: Text('Está certo disso?'),
                      actions: <Widget>[
                        // ignore: deprecated_member_use
                        FlatButton(
                          child: Text('Não'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          child: Text('Sim'),
                          onPressed: () {
                            Provider.of<Users>(context, listen: false)
                                .remove(user);
                            Navigator.of(context).pop();
                          },
                        ),
                      ]),
                );
                Provider.of<Users>(context, listen: false).remove(user);
              },
              color: Colors.red,
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}

class Widget {
}

class BuildContext {
}

class StatelessWidget {
}
