import 'package:flutter/material.dart';

class RoutePage {
  String name;
  WidgetBuilder builder;

  RoutePage(this.name, this.builder);
}

buildBodyWithTitle(String title, Widget widget) {
  return Scaffold(
      //标题
      appBar: AppBar(
        title: Text(title),
      ),
      //内容
      body: widget);
}

buildListBodyWithTitle(String title, BuildContext context, List<RoutePage> pages, {int listSpanSize = 3}) {
  return Scaffold(
      //标题
      appBar: AppBar(
        title: Text(title),
      ),
      //内容
      body: buildListBody(pages, spanSize: listSpanSize));
}

GridView buildListBody(List<RoutePage> pages, {int spanSize = 3}) {
  return GridView.builder(
    itemCount: pages.length,
    padding: const EdgeInsets.all(10),
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
            child: Text(
              pages[index].name,
              style: const TextStyle(fontSize: 12),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: pages[index].builder));
            }),
      );
    },
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: spanSize),
  );
}
