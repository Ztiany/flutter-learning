import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_v3/state_management/state_management_page.dart';

import 'common.dart';
import 'facilities/error_reporter.dart';
import 'lifecycle/lifecycle_page.dart';

void main() {
  //错误页面
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    return Scaffold(
        body: Center(
      child: Text("Error: $flutterErrorDetails"),
    ));
  };

  // 将 debugPrint 指定为同步打印数据
  debugPrint = (String? message, {int? wrapWidth}) {
    debugPrintSynchronously(message, wrapWidth: wrapWidth);
  };

  FlutterError.onError = (FlutterErrorDetails details) async {
    // 转发至 Zone 中
    Zone.current.handleUncaughtError(details.exception, details.stack ?? StackTrace.empty);
  };

  runZonedGuarded(() => runApp(const FlutterBasicApp()), (error, stack) {
    reportError(error, stack);
  });
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
  return [
    RoutePage("生命周期", (context) => buildLifecyclePagesWidget(context)),
    RoutePage("基础组件", (context) => buildStateManagementPagesWidget(context)),
    RoutePage("基础布局", (context) => buildStateManagementPagesWidget(context)),
    RoutePage("主题定制", (context) => buildStateManagementPagesWidget(context)),
    RoutePage("手势处理", (context) => buildStateManagementPagesWidget(context)),
    RoutePage("组件绘制", (context) => buildStateManagementPagesWidget(context)),
    RoutePage("滑动处理", (context) => buildStateManagementPagesWidget(context)),
    RoutePage("动画效果", (context) => buildStateManagementPagesWidget(context)),
    RoutePage("网络请求", (context) => buildStateManagementPagesWidget(context)),
    RoutePage("本地方法", (context) => buildStateManagementPagesWidget(context)),
    RoutePage("本地视图", (context) => buildStateManagementPagesWidget(context)),
    RoutePage("路由机制", (context) => buildStateManagementPagesWidget(context)),
    RoutePage("数据传递", (context) => buildStateManagementPagesWidget(context)),
    RoutePage("状态管理", (context) => buildStateManagementPagesWidget(context))
  ];
}
