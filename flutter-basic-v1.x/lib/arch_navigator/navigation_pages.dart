import 'package:flutter/material.dart';
import 'package:flutter_basic/common.dart';

//导航
import 'package:flutter_basic/arch_navigator/01_base-router.dart';
import 'package:flutter_basic/arch_navigator/02_base-roter-pass.dart';
import 'package:flutter_basic/arch_navigator/03_base-router-return.dart';
import 'package:flutter_basic/arch_navigator/04-named-router.dart';

List<RoutePage> _buildRoutes() {
  return [
    //basic navigator
    RoutePage("BaseRouter", (context) => buildBaseRouterWidget()),
    RoutePage("BaseRouter PassValue", (context) => buildBaseRouterPassWidget()),
    RoutePage("BaseRouter ReturnValue", (context) => buildBaseRouterGetWidget()),
    RoutePage("NamedRouter", (context) => buildNamedRouterWidget()),
  ];
}

/*
路由(Route)在移动开发中通常指页面（Page），这跟web开发中单页应用的Route概念意义是相同的，
Route在Android中通常指一个Activity，在iOS中指一个ViewController。
所谓路由管理，就是管理页面之间如何跳转，通常也可被称为导航管理。
 */
Widget buildNavigationPagesWidget(BuildContext context) =>
    buildListBody("导航", context, _buildRoutes());