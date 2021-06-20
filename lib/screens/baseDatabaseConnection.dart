import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class BaseDatabaseConnect extends StatefulWidget {
  const BaseDatabaseConnect({Key? key}) : super(key: key);

  @override
  _BaseDatabaseConnectState createState() => _BaseDatabaseConnectState();
}

class _BaseDatabaseConnectState extends State<BaseDatabaseConnect> {
  bool names = true, api = false, password = false, password1 = false;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            width: 1100,
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
                        ),
                        Opacity(
                            opacity: 0.5,
                            child: Container(
                                height: 25,
                                width: 120,
                                color: Color(0xff3C3F41),
                                alignment: Alignment.center,
                                child: Text(
                                    "SSH Тоннель"
                                )
                            )
                        )
                      ]
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    width: 200,
                                    child: Text("Состояние:"),
                                  ),
                                  title: Text("Не подключено"),
                                ),
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
                                          color: Color(0xffFFFFFF),
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
                                          color: Color(0xffFFFFFF),
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
                                          height: 20,
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
                                          color: Color(0xffFFFFFF),
                                        )
                                    )
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
                                        )
                                    )
                                ),
                                ListTile(
                                  leading: Checkbox(
                                    value: names,
                                    activeColor: Colors.transparent,
                                    onChanged: (value) => setState(() => names = value!),
                                  ),
                                  title: Text("Приводить имена объектов к верхнему регистру"),
                                ),
                                ListTile(
                                  leading: Checkbox(
                                    value: api,
                                    activeColor: Colors.transparent,
                                    onChanged: (value) => setState(() => api = value!),
                                  ),
                                  title: Text("Использовать новое OO API (Позволяет использовать пакетные операции в генераторе данных)"),
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
                                      child: Text("JDBC Драйвер:"),
                                    ),
                                    title: Opacity(
                                        opacity: 0.1,
                                        child: Container(
                                          height: 20,
                                          width: double.infinity,
                                          color: Color(0xffFFFFFF),
                                        )
                                    )
                                ),
                                ListTile(
                                    leading: Container(
                                      width: 200,
                                      child: Text("Параметры подключения:"),
                                    ),
                                    title: Opacity(
                                        opacity: 0.1,
                                        child: Container(
                                          height: 20,
                                          width: double.infinity,
                                          color: Color(0xffFFFFFF),
                                        )
                                    )
                                ),
                                ListTile(
                                    leading: Container(
                                      width: 200,
                                      child: Text("Аутентификация:"),
                                    ),
                                    title: Opacity(
                                        opacity: 0.1,
                                        child: Container(
                                          height: 20,
                                          width: double.infinity,
                                          color: Color(0xffFFFFFF),
                                        )
                                    )
                                ),
                                ListTile(
                                    leading: Container(
                                        width: 200,
                                        child: Text("Роль:")
                                    ),
                                    title: Opacity(
                                        opacity: 0.1,
                                        child: Container(
                                          height: 20,
                                          width: double.infinity,
                                          color: Color(0xffFFFFFF),
                                        )
                                    )
                                ),
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
                                )
                              ],
                            )
                        )
                      ],
                    )
                ),

              ],
            ),
          )
      )
    ],
  );
}