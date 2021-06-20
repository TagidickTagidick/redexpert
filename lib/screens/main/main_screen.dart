import 'package:admin/constants.dart';
import 'package:admin/models/side_bar_item.dart';
import 'package:admin/models/tool_bar_item.dart';
import 'package:admin/screens/baseDatabaseConnection.dart';
import 'package:admin/screens/batabaseConnect.dart';
import 'package:admin/screens/createDatabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/menu_item.dart';
import 'package:flutter_treeview/flutter_treeview.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double padding = 0.0;

  Status status = Status.database;

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  String? _selectedNode;
  bool docsOpen = true;
  List<Node>? _nodes;
  TreeViewController? _treeViewController;
  bool _allowParentSelect = false;
  bool _supportParentDoubleTap = false;

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
        ]),
    ToolBarItem(
        status: Status.database,
        text: "Подключение к базе данных",
        child: [
          ToolBarItem(status: Status.folder, text: "Favourites", child: []),
          ToolBarItem(
              status: Status.connection, text: "Новое подключение", child: [])
        ])
  ];

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = toolBarItems.removeAt(oldindex);
      toolBarItems.insert(newindex, items);
    });
  }

  List<MenuItem> menuItems = [
    MenuItem(text: "Файл", items: [
      "Создать",
      "Открыть",
      "Недавние файлы",
      "Сохранить",
      "Сохранить как",
      "Печать",
      "Свойства печати",
      "Предварительный просмотр",
      "Выход"
    ]),
    MenuItem(text: "Правка", items: [
      "Отмена действия",
      "Возврат отмененного действия",
      "Недавние файлы",
      "Сохранить",
      "Сохранить как",
      "Печать",
      "Свойства печати",
      "Предварительный просмотр",
      "Выход"
    ]),
    MenuItem(text: "Поиск", items: ["Выход"]),
    MenuItem(text: "Вид", items: ["Выход"]),
    MenuItem(text: "Базы данных", items: ["Выход"]),
    MenuItem(text: "Инструменты", items: ["Выход"]),
    MenuItem(text: "Поиск", items: ["Выход"]),
    MenuItem(text: "Справка", items: ["Выход"]),
  ];

  @override
  void initState() {
    _nodes = [
      Node(
        label: 'Подключение к базе данных',
        key: 'docs',
        expanded: docsOpen,
        icon: Icons.input,
        children: [
          Node(
            label: 'Favourites',
            key: 'd1',
            icon: Icons.folder_open,
          ),
          Node(
              label: 'Новое подключение',
              key: 'd2',
              icon: Icons.insert_drive_file
          )
        ],
      ),
    ];
    _treeViewController = TreeViewController(
      children: _nodes!,
      selectedKey: _selectedNode,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TreeViewTheme _treeViewTheme = TreeViewTheme(
      labelStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.3,
      ),
      parentLabelStyle: TextStyle(
        fontSize: 16,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        size: 18,
        color: Colors.white,
      ),
      colorScheme: Theme.of(context).colorScheme,
    );
    return Scaffold(
      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                color: secondaryColor,
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset('assets/icons/logo.svg')),
                    for (var itm in menuItems) menuText(itm)
                  ],
                ),
              ),
              SizedBox(height: 1),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                color: secondaryColor,
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
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.7,
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
                                                  padding:
                                                  EdgeInsets.only(left: 10),
                                                  child: GestureDetector(
                                                      onTap: () => setState(() {
                                                        item.isTapped = true;
                                                      }),
                                                      child: Container(
                                                          height: 31,
                                                          width: 112,
                                                          child:
                                                          Column(children: [
                                                            Row(children: [
                                                              SvgPicture.asset(
                                                                  item.icon!),
                                                              SizedBox(width: 5),
                                                              Text(item.title!)
                                                            ]),
                                                            SizedBox(height: 5),
                                                            Container(
                                                                height: 10,
                                                                width: double
                                                                    .infinity,
                                                                color: item
                                                                    .isTapped!
                                                                    ? Color(
                                                                    0xff8A2627)
                                                                    : Color(
                                                                    0xff3C3F41))
                                                          ]))))
                                          ],
                                        ),
                                      ),
                                      Container(
                                          width: 274,
                                          height:
                                          MediaQuery.of(context).size.height -
                                              200,
                                          child: Column(children: [
                                            Container(
                                                height: 25,
                                                color: Color(0xff8A2627),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 5),
                                                child: Row(children: [
                                                  Text("Подключения"),
                                                  Spacer(),
                                                  SvgPicture.asset(
                                                      "assets/icons/exit.svg")
                                                ])),
                                            Container(
                                              height: 25,
                                              color: Color(0xff323536),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5),
                                              child: Row(
                                                children: [
                                                  databaseToolBar(
                                                      'connection', 15),
                                                  databaseToolBar(
                                                      'databaseAdd', 15),
                                                  databaseToolBar(
                                                      'newFolder', 15),
                                                  databaseToolBar('database', 15),
                                                  databaseToolBar('up', 15),
                                                  databaseToolBar('down', 15),
                                                  databaseToolBar('refresh', 15),
                                                  databaseToolBar('alphabet', 15),
                                                  databaseToolBar('delete', 15),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: TreeView(
                                                controller: _treeViewController!,
                                                allowParentSelect: _allowParentSelect,
                                                supportParentDoubleTap: _supportParentDoubleTap,
                                                onExpansionChanged: (key, expanded) =>
                                                    _expandNode(key, expanded),
                                                onNodeTap: (key) {
                                                  debugPrint('Selected: $key');
                                                  setState(() {
                                                    _selectedNode = key;
                                                    _treeViewController =
                                                        _treeViewController!.copyWith(
                                                            selectedKey: key);
                                                  });
                                                },
                                                theme: _treeViewTheme,
                                              ),
                                            )
                                          ]))
                                    ]))),
                        Column(
                          children: [
                            Container(
                                height: 20,
                                width: MediaQuery.of(context).size.width * 0.7,
                                color: secondaryColor),
                            Container(
                                color: secondaryColor,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  color: bgColor,
                                  child: windows(status),
                                )),
                          ],
                        )
                      ])),
            ],
          ),
        ),
      ),
    );
  }

  Widget databaseToolBar(String name, double size) => Container(
        padding: EdgeInsets.only(left: 7, right: 7),
        child: SvgPicture.asset(
          'assets/icons/databaseToolBar/$name.svg',
          width: size,
          height: size,
        ),
      );

  Widget windows(Status status) {
    switch (status) {
      case Status.database:
        return DatabaseConnect();
      case Status.folder:
        return BaseDatabaseConnect();
      case Status.connection:
        return CreateDatabase();
      default:
        Container();
    }
    return Container();
  }

  Padding menuText(MenuItem item) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: PopupMenuButton(
          padding: EdgeInsets.all(0),
          child: Container(
            height: 20,
            child: Text(item.text!),
          ),
          initialValue: item.text,
          itemBuilder: (BuildContext context) {
            return item.items!.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                height: 16,
                child: Container(
                    width: 100,
                    child: Text(choice, style: TextStyle(color: Colors.white))),
                onTap: () {},
              );
            }).toList();
          },
        ),
      );

  _expandNode(String key, bool expanded) {
    String msg = '${expanded ? "Expanded" : "Collapsed"}: $key';
    debugPrint(msg);
    Node? node = _treeViewController!.getNode(key);
    if (node != null) {
      List<Node> updated;
      if (key == 'docs') {
        updated = _treeViewController!.updateNode(
          key,
          node.copyWith(
              expanded: expanded,
              icon: Icons.folder_open),
        );
      } else {
        updated = _treeViewController!.updateNode(
            key, node.copyWith(expanded: expanded));
      }
      setState(() {
        if (key == 'docs') docsOpen = expanded;
        _treeViewController = _treeViewController!.copyWith(children: updated);
      });
    }
  }

  Container toolItem(String name, double size) => Container(
        padding: EdgeInsets.only(left: 6, right: 6),
        child: SvgPicture.asset(
          'assets/icons/toolbar/$name.svg',
          width: size,
          height: size,
        ),
      );

  GestureDetector tree(ToolBarItem item, double padding, int index) =>
      GestureDetector(
          key: ValueKey(index),
          onTap: () => setState(() => status = item.status!),
          child: item.child!.length == 0
              ? Container(
                  color: secondaryColor,
                  height: 25,
                  padding: EdgeInsets.only(
                      top: 5, left: 5 + padding, right: 5, bottom: 5),
                  child: Row(children: [
                    SvgPicture.asset(item.status == Status.database
                        ? "assets/icons/database/database.svg"
                        : item.status == Status.folder
                            ? "assets/icons/database/folder.svg"
                            : "assets/icons/database/connection.svg"),
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
                      for (int i = 0; i < item.child!.length; i++)
                        tree(item.child![i], padding + 10, i + 10 * index)
                    ]));
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
