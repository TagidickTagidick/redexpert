enum Status {
  database,
  folder,
  connection
}

class ToolBarItem {
  final Status? status;
  final String? text;
  final List<ToolBarItem>? child;
  bool isOpened;
  ToolBarItem({this.status, this.text, this.child, this.isOpened = false});
}