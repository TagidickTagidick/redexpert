import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DatabaseConnect extends StatefulWidget {
  const DatabaseConnect({Key? key}) : super(key: key);

  @override
  _DatabaseConnectState createState() => _DatabaseConnectState();
}

class _DatabaseConnectState extends State<DatabaseConnect> {
  var textStyle = TextStyle(fontSize: 14, color: textColor, fontWeight: FontWeight.w100);
  var textStyle1 = TextStyle(fontSize: 12, color: textColor, fontWeight: FontWeight.w100);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.85,
        color: Color(0xFF3C3F41),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Подключение к базе данных',
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 16),
              Text(
                'Параметры подключения определенные пользователем',
                style: TextStyle(fontSize: 14),
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
                            style: TextStyle(fontSize: 12, color: textColor),
                          ),
                        )),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                        width: 180,
                        color: Color(0xFF46494A),
                        child: FlatButton(
                          onPressed: null,
                          child: Text(
                            'Создать базу данных',
                            style: textStyle
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Доступные подключения',
                style: textStyle
              ),
              Container(
                width: 980,
                height: 30,
                color: Color(0xFF46494A),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      child: Text(' '),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text('Имя подключения', textAlign: TextAlign.center, style: textStyle),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text('Сервер', textAlign: TextAlign.center, style: textStyle),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text('Путь к базе данных', textAlign: TextAlign.center,style: textStyle),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text('Пользователь', textAlign: TextAlign.center,style: textStyle),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text('Драйвер', textAlign: TextAlign.center,style: textStyle),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 30,
                color: Color(0xFF535657),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      child: SvgPicture.asset('assets/icons/databaseToolBar/connection.svg', width: 20, height: 20, color: Colors.white,),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text('Новое подключение', style: textStyle1, textAlign: TextAlign.center),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text('localhost', style: textStyle1),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text('', style: textStyle1),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text('', style: textStyle1),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text('Jaybird 3 Driver', style: textStyle1),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: Color(0xFF46494A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
