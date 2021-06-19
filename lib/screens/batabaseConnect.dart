import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class DatabaseConnect extends StatefulWidget {
  const DatabaseConnect({Key? key}) : super(key: key);

  @override
  _DatabaseConnectState createState() => _DatabaseConnectState();
}

class _DatabaseConnectState extends State<DatabaseConnect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 1000,
        height: 600,
        color: secondaryColor,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Подключение к базе данных',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              Text(
                'Параметры подключения определенные пользователем',
                style: TextStyle(fontSize: 16),
              ),
              Container(
                width: 450,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: 180,
                        color: Color(0xFF46494A),
                        child: FlatButton(
                          onPressed: null,
                          child: Text(
                            'Новое подключение',
                            style: TextStyle(fontSize: 14, color: textColor),
                          ),
                        )),
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    Container(
                        width: 180,
                        color: Color(0xFF46494A),
                        child: FlatButton(
                          onPressed: null,
                          child: Text(
                            'Создать базу данных',
                            style: TextStyle(fontSize: 14, color: textColor),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Доступные подключения',
                style: TextStyle(fontSize: 14, color: textColor),
              ),
              Container(
                width: 980,
                height: 380,
                color: Color(0xFF4A4D4E),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
