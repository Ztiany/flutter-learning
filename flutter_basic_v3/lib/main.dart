import 'package:flutter/material.dart';
import 'package:flutter_basic_v3/state_management/state_management_page.dart';

import 'common.dart';

void main() {
  runApp(const FlutterBasicApp());
}

class FlutterBasicApp extends StatelessWidget {
  const FlutterBasicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // 配置App主题，颜色模式：亮色、暗色
        theme: ThemeData(brightness: Brightness.dark),
        // 首页
        home: buildListBodyWithTitle("Flutter", context, _buildModulePages()));
  }
}

List<RoutePage> _buildModulePages() {
  return [RoutePage("状态管理", (context) => buildStateManagementPagesWidget(context))];
}
