import 'package:flutter/material.dart';

/// Used to build pages for a pager view.
class PagerBuilder {
  final String title;
  final WidgetBuilder builder;

  PagerBuilder({required this.title, required this.builder});
}

/// Creates a pager list view with the given title and pages.
Widget createPagerList(
  String title,
  BuildContext context,
  List<PagerBuilder> pages,
) {
  return Scaffold(
    // title
    appBar: AppBar(title: Text(title)),
    // body
    body: GridView.builder(
      itemCount: pages.length,
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(33),
          ),
          child: TextButton(
            child: Text(pages[index].title, style: TextStyle(fontSize: 14)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: pages[index].builder),
              );
            },
          ),
        );
      },
      // this creates a grid with 3 columns.
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
      ),
    ),
  );
}
