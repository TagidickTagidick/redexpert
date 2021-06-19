import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/side_bar_item.dart';
import '../../../models/tool_bar_item.dart';

class SideMenu extends StatefulWidget {
  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  double padding = 0.0;

  List<SideBarItem> sideBarItems = [
    SideBarItem(
        icon: "assets/icons/connections.svg",
        title: "Подключения",
        isTapped: true),
    SideBarItem(
        icon: "assets/icons/drivers.svg", title: "Драйверы", isTapped: false)
  ];

  List<ToolBarItem> toolBarItems = [
    ToolBarItem(
        status: Status.database,
        text: "Подключение к базе данных",
        child: [
          ToolBarItem(status: Status.folder, text: "Favourites", child: []),
          ToolBarItem(
              status: Status.connection, text: "Новое подключение", child: [])
        ])
  ];

  @override
  Widget build(BuildContext context) => Container(
      width: 304,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RotatedBox(
                quarterTurns: 1,
                child: Row(children: [
                  for (var item in sideBarItems)
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Container(
                            height: 30,
                            width: 112,
                            child: Column(children: [
                              Row(children: [
                                SvgPicture.asset(item.icon!),
                                SizedBox(width: 5),
                                Text(item.title!)
                              ]),
                              Container(
                                  height: 10,
                                  width: double.infinity,
                                  color: item.isTapped!
                                      ? Color(0xff8A2627)
                                      : Color(0xff3C3F41))
                            ])))
                ])),
            Container(
                width: 274,
                child: Column(children: [
                  Container(
                      height: 25,
                      color: Color(0xff8A2627),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Row(children: [
                        Text("Подключения"),
                        Spacer(),
                        SvgPicture.asset("assets/icons/exit.svg")
                      ])),
                  Row(children: []),
                  Column(children: [
                    for (ToolBarItem item in toolBarItems)
                      tree(item, padding + 10)
                  ])
                ]))
          ]));

  Column tree(ToolBarItem item, double padding) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        item.child!.length == 0
            ? Container(
                height: 25,
                padding: EdgeInsets.only(
                    top: 5, left: 5 + padding, right: 5, bottom: 5),
                child: Row(children: [
                  SvgPicture.asset(item.status == Status.database
                      ? "assets/icons/toolbar/code.svg"
                      : item.status == Status.folder
                          ? "assets/icons/toolbar/code.svg"
                          : "assets/icons/toolbar/code.svg"),
                  SizedBox(width: 10),
                  Text(item.text!)
                ]))
            : ExpansionTile(
                tilePadding: EdgeInsets.symmetric(horizontal: 5 + padding),
                leading: SvgPicture.asset(item.status == Status.database
                    ? "assets/icons/toolbar/code.svg"
                    : item.status == Status.folder
                        ? "assets/icons/toolbar/code.svg"
                        : "assets/icons/toolbar/code.svg"),
                title: Text(item.text!),
                children: [
                  for (ToolBarItem i in item.child!) tree(i, padding + 10)
                ],
              )
      ]);
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
    this.isFolder = false,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isFolder;

  @override
  Widget build(BuildContext context) => ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      contentPadding: EdgeInsets.only(left: isFolder ? 10 : 20),
      leading: SvgPicture.asset(svgSrc, height: 16),
      title: Text(title, style: TextStyle(color: Colors.white54)));
}
