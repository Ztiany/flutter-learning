import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_v3/common.dart';

import 'sublifecycle_stateful_widget.dart';

/// 创建有状态测试组件
class AppLifecycleStatefulWidget extends StatefulWidget {
  const AppLifecycleStatefulWidget({super.key});

  @override
  // ignore: no_logic_in_create_state
  createState() {
    if (kDebugMode) {
      print('create state');
    }
    return _AppState();
  }
}

/// 创建状态管理类，继承状态测试组件
class _AppState extends State<AppLifecycleStatefulWidget> with WidgetsBindingObserver {
  @override
  initState() {
    WidgetsBinding.instance.addObserver(this); // 注册监听器
    if (kDebugMode) {
      print('init state');
    }
    super.initState();
  }

  @override
  didChangeDependencies() {
    if (kDebugMode) {
      print('did change dependencies');
    }
    super.didChangeDependencies();
  }

  @override
  didUpdateWidget(AppLifecycleStatefulWidget oldWidget) {
    if (kDebugMode) {
      print('did update widget');
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  deactivate() {
    if (kDebugMode) {
      print('deactivate');
    }
    super.deactivate();
  }

  @override
  dispose() {
    if (kDebugMode) {
      print('dispose');
    }
    super.dispose();
    WidgetsBinding.instance.removeObserver(this); // 移除监听器
  }

  @override
  reassemble() {
    if (kDebugMode) {
      print('reassemble');
    }
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build');
    }
    return const Center(child: Text("APP Lifecycle"));
  }

  @override
  Future<bool> didPopRoute() {
    if (kDebugMode) {
      print('didPopRoute');
    }
    return super.didPopRoute();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (kDebugMode) {
      print('didChangeAppLifecycleState: $state');
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeMetrics() {
    if (kDebugMode) {
      print('didChangeMetrics');
    }
  }

}