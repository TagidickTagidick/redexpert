import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateDatabase extends StatefulWidget {
  const CreateDatabase({Key? key}) : super(key: key);

  @override
  _CreateDatabaseState createState() => _CreateDatabaseState();
}

class _CreateDatabaseState extends State<CreateDatabase> {
  bool names = true, api = false, password = false, password1 = false;

  @override
  Widget build(BuildContext context) => Column(
      children: [
        Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: 500,
              color: secondaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 25,
                    color: Color(0xff2B2B2B),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 25,
                              width: 120,
                              color: Color(0xff3C3F41),
                              alignment: Alignment.center,
                              child: Text(
                                  "Базовые"
                              )
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: Container(
                                height: 25,
                                width: 120,
                                color: Color(0xff3C3F41),
                                alignment: Alignment.center,
                                child: Text(
                                    "Расширенные"
                                )
                            ),
                          )
                        ]
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              width: 200,
                              child: Text("JDBC Драйвер:"),
                            ),
                            title: Opacity(
                                opacity: 0.1,
                                child: Container(
                                  height: 20,
                                  width: double.infinity,
                                  color: Color(0xffFFFFFF),
                                  alignment: Alignment.centerRight,
                                  child: SvgPicture.asset("assets/icons/arrow.svg"),
                                )
                            ),
                            trailing: Container(
                              width: 125,
                              height: 20,
                              color: Color(0xff5C6264),
                              alignment: Alignment.center,
                              child: Text("Новый драйвер"),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Column(
                                    children: [
                                      ListTile(
                                          leading: Container(
                                            width: 200,
                                            child: Text("Имя подключения:"),
                                          ),
                                          title: Opacity(
                                              opacity: 0.1,
                                              child: Container(
                                                  height: 20,
                                                  width: double.infinity,
                                                  color: Color(0xffFFFFFF)
                                              )
                                          )
                                      ),
                                      ListTile(
                                          leading: Container(
                                            width: 200,
                                            child: Text("Имя сервера:"),
                                          ),
                                          title: Opacity(
                                              opacity: 0.1,
                                              child: Container(
                                                  height: 20,
                                                  width: double.infinity,
                                                  color: Color(0xffFFFFFF)
                                              )
                                          )
                                      ),
                                      ListTile(
                                          leading: Container(
                                            width: 200,
                                            child: Text("Порт:"),
                                          ),
                                          title: Opacity(
                                              opacity: 0.1,
                                              child: Container(
                                                height: 40,
                                                width: double.infinity,
                                                color: Color(0xffFFFFFF),
                                              )
                                          )
                                      ),
                                      ListTile(
                                        leading: Container(
                                          width: 200,
                                          child: Text("Файл базы данных:"),
                                        ),
                                        title: Opacity(
                                            opacity: 0.1,
                                            child: Container(
                                                height: 20,
                                                width: double.infinity,
                                                color: Color(0xffFFFFFF)
                                            )
                                        ),
                                        trailing: Container(
                                          width: 50,
                                          height: 20,
                                          color: Color(0xff5C6264),
                                          child: SvgPicture.asset("assets/icons/3points.svg"),
                                        ),
                                      ),
                                      ListTile(
                                          leading: Container(
                                            width: 200,
                                            child: Text("Кодировка:"),
                                          ),
                                          title: Opacity(
                                              opacity: 0.1,
                                              child: Container(
                                                height: 20,
                                                width: double.infinity,
                                                color: Color(0xffFFFFFF),
                                                alignment: Alignment.centerRight,
                                                child: SvgPicture.asset("assets/icons/arrow.svg"),
                                              )
                                          )
                                      )
                                    ],
                                  )
                              ),
                              Expanded(
                                  child: Column(
                                    children: [
                                      ListTile(
                                          leading: Container(
                                            width: 200,
                                            child: Text("Имя пользователя:"),
                                          ),
                                          title: Opacity(
                                              opacity: 0.1,
                                              child: Container(
                                                height: 20,
                                                width: double.infinity,
                                                color: Color(0xffFFFFFF),
                                                alignment: Alignment.centerRight,
                                                child: SvgPicture.asset("assets/icons/arrow.svg"),
                                              )
                                          )
                                      ),
                                      ListTile(
                                          leading: Container(
                                            width: 200,
                                            child: Text("Пароль:"),
                                          ),
                                          title: Opacity(
                                              opacity: 0.1,
                                              child: Container(
                                                height: 20,
                                                width: double.infinity,
                                                color: Color(0xffFFFFFF),
                                                alignment: Alignment.centerRight,
                                                child: SvgPicture.asset("assets/icons/arrow.svg"),
                                              )
                                          )
                                      ),
                                      Row(
                                          children: [
                                            Checkbox(
                                              value: password,
                                              activeColor: Colors.transparent,
                                              onChanged: (value) => setState(() => password = value!),
                                            ),
                                            SizedBox(width: 5),
                                            Text("Сохранить пароль"),
                                            SizedBox(width: 10),
                                            Checkbox(
                                              value: password,
                                              activeColor: Colors.transparent,
                                              onChanged: (value) => setState(() => password = value!),
                                            ),
                                            SizedBox(width: 5),
                                            Text("Сохранить пароль"),
                                            Spacer(),
                                            Text(
                                              "Показать пароль",
                                              style: TextStyle(
                                                  color: Color(0xffFF4F4F)
                                              ),
                                            )
                                          ]
                                      ),
                                      ListTile(
                                          leading: Container(
                                            width: 200,
                                            child: Text("Кодировка:"),
                                          ),
                                          title: Opacity(
                                              opacity: 0.1,
                                              child: Container(
                                                height: 20,
                                                width: double.infinity,
                                                color: Color(0xffFFFFFF),
                                                alignment: Alignment.centerRight,
                                                child: SvgPicture.asset("assets/icons/arrow.svg"),
                                              )
                                          )
                                      )
                                    ],
                                  )
                              )
                            ],
                          )
                        ],
                      )
                  ),
                ],
              ),
            )
        ),
        Container(
          height: 20,
          width: MediaQuery.of(context).size.width * 0.75,
          color: Color(0xff3C3F41),
          child: Text("Вывод консоли"),
        ),
        Container(
            height: 249,
            width: MediaQuery.of(context).size.width * 0.75,
            child: ListView(
                shrinkWrap: true,
                children: [
                  Text("[11:53:30]             Using Java version 16.0.1"),
                  Text("[11:53:30]             RedXpert version: 2021.03-202101"),
                  Text("[11:53:30]             Operating System: Windows 10 [ 10.0 ]"),
                  Text("[11:53:30]             System is ready."),
                  Text("[11:53:31]             Checking for new version update from https://reddatabase.ru ..."),
                  Text("[11:53:32]             RedXpert is up to date."),
                  Text("[11:54:16]             Loading JDBC driver class: org.firebirdsql.jdbc.FBDriver"),
                  Text("[11:54:16]             JDBC driver org.firebirdsql.jdbc.FBDriver loaded - v3.0"),
                  Text("[12:22:22]             java.io.IOException: Failed to open file:/C:/Users/izyab.LAPTOP-74MD01HH/Рабочий%20стол/redexpert/modules/redexpert/target/guide/RedXpert_Guide-ru.pdf. Error message: Не удается найти указанный файл."),
                  Text("[12:22:22] 	           at java.desktop/sun.awt.windows.WDesktopPeer.ShellExecute(WDesktopPeer.java:115)"),
                  Text("[12:22:22] 	           at java.desktop/sun.awt.windows.WDesktopPeer.browse(WDesktopPeer.java:101)"),
                  Text("[12:22:22] 	           at java.desktop/java.awt.Desktop.browse(Desktop.java:530)")
                ]
            )
        )
      ]
  );
}