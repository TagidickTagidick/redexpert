import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class Querry extends StatefulWidget {
  const Querry({Key? key}) : super(key: key);

  @override
  _QuerryState createState() => _QuerryState();
}

class _QuerryState extends State<Querry> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.85,
        color: secondaryColor,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 30,
                color: Color(0xFF535657),
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
                height: 30,
                color: Color(0xFF535657),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 110,
                      child: Text('Подключение'),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 140,
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
                    VerticalDivider(),
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
