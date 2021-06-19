import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: Row(
              children: [
                toolItem('createfile', 18),
                toolItem('file', 18),
                toolItem('save', 18),
                VerticalDivider(),
                toolItem('print', 18),
                VerticalDivider(),
                toolItem('cut', 20),
                toolItem('copy', 18),
                toolItem('insertFile', 18),
                VerticalDivider(),
                toolItem('undo', 18),
                toolItem('redo', 18),
                VerticalDivider(),
                toolItem('edit', 18),
                toolItem('databaseAdd', 18),
                toolItem('code', 18),
                toolItem('run', 18),
                toolItem('database', 20),
                toolItem('people', 18),
                toolItem('key', 18),
                VerticalDivider(),
                toolItem('wrench', 18),
                toolItem('help', 18),
                toolItem('info', 18),
              ],
            ),
          ),
          SafeArea(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (Responsive.isDesktop(context)) Expanded(child: SideMenu()),
            Expanded(flex: 5, child: DashboardScreen())
          ])),
        ],
      ));
  Widget toolItem(String name, double size) => Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: SvgPicture.asset(
          'assets/icons/toolbar/$name.svg',
          width: size,
          height: size,
        ),
      );
}
