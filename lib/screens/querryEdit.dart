import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class Querry extends StatefulWidget {
  const Querry({Key? key}) : super(key: key);

  @override
  _QuerryState createState() => _QuerryState();
}

class _QuerryState extends State<Querry> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.85,
        color: secondaryColor,
        child: Container(
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
                                  "Вывод"
                              )
                          ),
                        ]
                    ),
                  ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 30,
                color: Color(0xFF46494A),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 1; i < 20; i++) iconShow(i),
                  ],
                ),
              ),
              SizedBox(height: 1),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 26,
                color: Color(0xFF46494A),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 80,
                      child: Text('Подключение:', style: TextStyle(fontSize: 12)),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 110,
                      height: 22,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          color: Color(0xFF818181),
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          )),
                          child: Icon(Icons.arrow_drop_down,size: 16),
                    ),
                    SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 120,
                      child: Text('Уровень изоляции транзакции:', style: TextStyle(fontSize: 12)),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 200,
                      height: 22,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          color: Color(0xFF818181),
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          )),
                          child: Row(
                            children: [
                              Text('Стандартная база данных', style: TextStyle(fontSize: 12)),
                              Icon(Icons.arrow_drop_down,size: 16),
                            ],
                          ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 55,
                      child: Text('Фильтр:', style: TextStyle(fontSize: 12)),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 80,
                      height: 22,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          color: Color(0xFF818181),
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          )),
                    ),
                    SizedBox(width: 5),
                    Checkbox(
                      value: isChecked,
                      activeColor: Colors.transparent,
                      onChanged: (value) => setState(() => isChecked = value!),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 130,
                      child: Text('Максимум строк:', style: TextStyle(fontSize: 12)),
                    ),
                    Container(
                      width: 50,
                      height: 22,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          color: isChecked ? Color(0xFF818181) : Color(0xFF5F5F5F),
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          )),
                    ),
                    SizedBox(width: 15),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 980,
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

  Widget iconShow(int i) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        alignment: Alignment.center,
        child: SvgPicture.asset('assets/icons/querryToolBar/$i.svg',
            height: 18, width: 18),
      );
}
