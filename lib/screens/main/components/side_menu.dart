import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/side_bar_item.dart';

class SideMenu extends StatelessWidget {
  List<SideBarItem> sideBarItems = [
    SideBarItem(
      icon: "assets/icons/connections.svg",
      title: "Подключения"
    )
  ];

  @override
  Widget build(BuildContext context) => Drawer(
      child: Row(
        children: [
          Container(
            child: Wrap(
              direction: Axis.vertical,
              children: [
              RotatedBox(
                  quarterTurns: 1,
                  child: Row(
                    children: [
                      for (var item in sideBarItems)
                        Container(
                            height: 100,
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
                                    color: Colors.red
                                )
                              ],
                            )
                        )
                    ]
                  )
              ),
                Container(
                  width: 100,
                  child: ListView(
                      children: [
                        BottomNavigationBar(
                          type: BottomNavigationBarType.fixed,
                          items: [
                            BottomNavigationBarItem(
                                icon: SvgPicture.asset(
                                    "assets/icons/drop_box.svg"
                                ),
                                label: ""
                            ),
                            BottomNavigationBarItem(
                                icon: SvgPicture.asset(
                                    "assets/icons/folder.svg"
                                ),
                                label: "да"
                            ),
                            BottomNavigationBarItem(
                                icon: SvgPicture.asset(
                                    "assets/icons/Documents.svg"
                                ),
                                label: ""
                            ),
                          ],
                        ),
                        DrawerListTile(
                            title: "Подключения к базе данных",
                            svgSrc: "assets/icons/drop_box.svg",
                            press: () {},
                            isFolder: true
                        ),
                        DrawerListTile(
                          title: "Favourites",
                          svgSrc: "assets/icons/folder.svg",
                          press: () {},
                        ),
                        DrawerListTile(
                            title: "Новое подключение",
                            svgSrc: "assets/icons/Documents.svg",
                            press: () {}
                        )
                      ]
                  )
                )
              ],
            ),
          ),
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
