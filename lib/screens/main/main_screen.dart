import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/batabaseConnect.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: Row(
              children: [
                toolItem('createfile', 16),
                toolItem('file', 16),
                toolItem('save', 16),
                VerticalDivider(color: Color(0xff2C2C2C)),
                toolItem('print', 16),
                VerticalDivider(color: Color(0xff2C2C2C)),
                toolItem('cut', 18),
                toolItem('copy', 16),
                toolItem('insertFile', 16),
                VerticalDivider(color: Color(0xff2C2C2C)),
                toolItem('undo', 16),
                toolItem('redo', 16),
                VerticalDivider(color: Color(0xff2C2C2C)),
                toolItem('edit', 16),
                toolItem('databaseAdd', 16),
                toolItem('code', 16),
                toolItem('run', 16),
                toolItem('database', 18),
                toolItem('people', 16),
                toolItem('key', 16),
                VerticalDivider(color: Colors.transparent),
                toolItem('wrench', 16),
                toolItem('help', 16),
                toolItem('info', 16),
              ],
            ),
          ),
          SafeArea(
              child:
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
            Expanded(
                child: SideMenu()
            ),
            DatabaseConnect()
            // Expanded(
            //     flex: 5,
            //     child: DashboardScreen()
            // )
          ])),
        ],
      ));
  Widget toolItem(String name, double size) => Container(
        padding: EdgeInsets.only(left: 6, right: 6),
        child: SvgPicture.asset(
          'assets/icons/toolbar/$name.svg',
          width: size,
          height: size,
        ),
      );
}
