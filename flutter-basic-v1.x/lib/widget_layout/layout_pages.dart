import 'package:flutter/material.dart';
import 'package:flutter_basic/common.dart';

//布局
import 'package:flutter_basic/widget_layout/01_layout.dart';
import 'package:flutter_basic/widget_layout/02_layout.dart';
import 'package:flutter_basic/widget_layout/03_constrained_box.dart';
import 'package:flutter_basic/widget_layout/04_material_pager1.dart';
import 'package:flutter_basic/widget_layout/04_material_pager2.dart';
import 'package:flutter_basic/widget_layout/04_material_pager3.dart';
import 'package:flutter_basic/widget_layout/06_update-item.dart';

List<RoutePage> _buildLayoutRoutes() {
  return [
    //layout
    RoutePage("LayoutDemo", (context) => buildLayoutWidget()),
    RoutePage("LayoutDemoInteractive", (context) => buildLayoutInteractiveWidget()),
    RoutePage("ConstrainedBox", (context) => buildConstrainedBoxWidget()),
    RoutePage("MaterialPager1", (context) => buildMaterialPagerWidget1()),
    RoutePage("MaterialPager2", (context) => buildMaterialPagerWidget2()),
    RoutePage("MaterialPager3", (context) => buildMaterialPagerWidget3()),
    RoutePage("UpdateItem", (context) => buildUpdateItemWidget())
  ];
}

Widget buildLayoutPagesWidget(BuildContext context) =>
    buildListBody("布局", context, _buildLayoutRoutes());