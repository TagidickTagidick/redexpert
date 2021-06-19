import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/side_bar_item.dart';

class SideMenu extends StatelessWidget {
  List<SideBarItem> sideBarItems = [
    SideBarItem(
      icon: "assets/icons/connections.svg",
      title: "Подключения",
      isTapped: true
    ),
    SideBarItem(
        icon: "assets/icons/connections.svg",
        title: "Подключения",
      isTapped: false
    ),
  ];

  @override
  Widget build(BuildContext context) => Drawer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RotatedBox(
              quarterTurns: 1,
              child: Row(
                  children: [
                    for (var item in sideBarItems)
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Container(
                            height: 26,
                            width: 112,
                            child: Column(
                                children: [
                                  Row(
                                      children: [
                                        SvgPicture.asset(
                                            item.icon!
                                        ),
                                        SizedBox(width: 5),
                                        Text(item.title!)
                                      ]
                                  ),
                                  Container(
                                      height: 10,
                                      width: double.infinity,
                                      color: item.isTapped!
                                          ? Color(0xff8A2627)
                                          : Color(0xff3C3F41)
                                  )
                                ]
                            )
                        ),
                      )
                  ]
              )
          ),
          Container(
            width: 100,
            child: Column(
                children: [
                  Container(
                    height: 20,
                    color: Color(0xff8A2627),
                    child: Row(
                      children: [
                        Text("Подключения"),
                        Spacer(),
                        SvgPicture.asset("assets/icons/exit.svg")
                      ],
                    ),
                  ),
                  Row(
                    children: [

                    ],
                  )
                ]
            )
          )
        ]
      )
  );
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
      leading: SvgPicture.asset(
          svgSrc,
          height: 16
      ),
      title: Text(
          title,
          style: TextStyle(color: Colors.white54)
      )
  );
}
