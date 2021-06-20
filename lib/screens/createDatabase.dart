import 'package:flutter/material.dart';

import '../constants.dart';

class CreateDatabase extends StatefulWidget {
  const CreateDatabase({Key? key}) : super(key: key);

  @override
  _CreateDatabaseState createState() => _CreateDatabaseState();
}

class _CreateDatabaseState extends State<CreateDatabase> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.85,
      color: secondaryColor,
      child: Container(
        padding: EdgeInsets.all(16),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
      ),
    );
  }
}
