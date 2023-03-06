import 'package:flutter/material.dart';
import 'package:flutter_basic/common.dart';


//传递数据
import 'package:flutter_basic/arch_passing-value/01-passing-value-by-inherrited.dart';
import 'package:flutter_basic/arch_passing-value/02-passing-value-by-notification.dart';
import 'package:flutter_basic/arch_passing-value/03-passing-value-by-eventbus.dart';

List<RoutePage> _buildRoutes() {
  return [
    //passing value
    RoutePage("PassValue-Inherited", (context) => buildPassValueByInheritedWidget()),
    RoutePage("PassValue-Notification", (context) => buildPassValueByNotification()),
    RoutePage("PassValue-EventBus", (context) => buildPassValueByEventBus()),
  ];
}

Widget buildPassValuePagesWidget(BuildContext context) =>
    buildListBody("传递数据", context, _buildRoutes());