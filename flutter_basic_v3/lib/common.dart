import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RoutePage {
  String name;
  WidgetBuilder builder;

  RoutePage(this.name, this.builder);
}

buildListBodyWithTitle(String title, BuildContext context, List<RoutePage> pages) {
  return Scaffold(
      //标题
      appBar: AppBar(
        title: Text(title),
      ),
      //内容
      body: buildListBody(pages));
}

GridView buildListBody(List<RoutePage> pages) {
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
              if (kDebugMode) {
                print("clicked-----------------------------------${pages[index].builder}");
              }
              Navigator.push(context, MaterialPageRoute(builder: pages[index].builder));
            }),
      );
    },
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
  );
}
