import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FloatingButtonUser extends StatefulWidget {
  User _user;

  FloatingButtonUser({Key key, User user})
      : _user = user,
        super(key: key);

  @override
  _FloatingButtonUserState createState() => _FloatingButtonUserState();
}

class _FloatingButtonUserState extends State<FloatingButtonUser>
    with SingleTickerProviderStateMixin {
  User _user;

  @override
  initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.green,
      child: _user.photoURL != null
          ? ClipOval(
              child: Material(
                color: Colors.grey,
                child: Image.network(
                  _user.photoURL,
                  fit: BoxFit.fitHeight,
                ),
              ),
            )
          : ClipOval(
              child: Material(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.person,
                    size: 25,
                  ),
                ),
              ),
            ),
    );
  }
}
