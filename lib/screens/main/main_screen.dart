import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
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
            color: Colors.red,
            width: MediaQuery.of(context).size.width,
            height: 20,
            child: Row(
              children: [
                toolItem('code', 18),
                toolItem('copy', 18),
                toolItem('createfile', 18),
                toolItem('cut', 18),
                toolItem('databaase', 18),
                toolItem('databaseAdd', 18),
                toolItem('edit', 18),
                toolItem('file', 18),
                toolItem('help', 18),
                toolItem('info', 18),
                toolItem('insertFile', 18),
                toolItem('key', 18),
                toolItem('people', 18),
                toolItem('print', 18),
                toolItem('redo', 18),
                toolItem('run', 18),
                toolItem('save', 18),
                toolItem('undo', 18),
                toolItem('wrench', 18),
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
        child: Image.asset('assets/icons/toolbar/$name.svg', scale: size),
      );
}
