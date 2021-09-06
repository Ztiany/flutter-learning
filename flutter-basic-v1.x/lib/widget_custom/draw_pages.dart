import 'package:flutter/material.dart';
import 'package:flutter_basic/common.dart';

//自定义View
import 'package:flutter_basic/widget_custom/draw-cake.dart';

List<RoutePage> _buildRoutes() {
  return [
    //Custom View
    RoutePage("CakeView", (context) => buildCustomCakeView()),
  ];
}

Widget buildCustomViewPagesWidget(BuildContext context) =>
    buildListBody("自定义View", context, _buildRoutes());