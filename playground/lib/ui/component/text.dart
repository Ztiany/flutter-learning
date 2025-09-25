import 'package:flutter/material.dart';

Widget textPager() => Center(
  child: Column(
    mainAxisSize: MainAxisSize.min,
    spacing: 10,
    children: [
      // a text without Material ancestor.
      // see https://stackoverflow.com/questions/51061147/what-is-the-difference-between-material-and-materialapp-in-flutter
      Text(
        "The yellow underlines you can find in Text is introduced by MaterialApp as "
        "a fallback Theme. It is here for debug purpose, to warn you that you "
        "need to use Material somewhere above your Text.",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 14),
      ),

      // a text with Material ancestor. It will not have yellow underline. Because
      // Material provides a default text style.
      Material(child: Text("Hello Flutter", textDirection: TextDirection.ltr)),
    ],
  ),
);
