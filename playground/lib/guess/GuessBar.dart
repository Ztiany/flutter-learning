import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GuessAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GuessAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,

      // make the app bar transparent
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),

      // leadingWidth: 54,
      titleSpacing: 0,
      leading: Icon(Icons.menu, color: Colors.black),

      actions: [
        IconButton(
          splashRadius: 20,
          onPressed: () {},
          icon: Icon(Icons.run_circle_outlined, color: Colors.blue),
        ),
      ],

      title: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0XFFF3F6F9),
          constraints: BoxConstraints(maxHeight: kToolbarHeight),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          hintText: "输入 0~99 数字",
          hintStyle: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
