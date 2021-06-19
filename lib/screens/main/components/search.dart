import 'package:admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/searchItem.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool checked = false;
  TextEditingController controller = TextEditingController();

  List<SearchItem> searchItems = [
    SearchItem(
        icon: "assets/icons/search/database.svg", title: "Поп", isTapped: true),
    SearchItem(
        icon: "assets/icons/search/database.svg", title: "1", isTapped: false),
    SearchItem(
        icon: "assets/icons/search/database.svg", title: "2", isTapped: false),
    SearchItem(
        icon: "assets/icons/search/database.svg", title: "3", isTapped: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 240,
              height: 29,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xffEAEFF3))),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Поиск',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            for (var item in searchItems)
              GestureDetector(
                onTap: () => setState(() {
                  for (var item1 in searchItems) item1.isTapped = false;
                  item.isTapped = true;
                }),
                child: Container(
                  padding: EdgeInsets.all(2),
                  height: 20,
                  width: 250,
                  color: item.isTapped ? Color(0xFF8A2627) : secondaryColor,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        item.icon.toString(),
                        width: 14,
                        height: 14,
                      ),
                      SizedBox(width: 5),
                      Text(item.title.toString()),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
