import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 创建子组件类
class SubLifecycleStatefulWidget extends StatefulWidget {
  const SubLifecycleStatefulWidget({super.key});

  @override
  // ignore: no_logic_in_create_state
  createState() {
    if (kDebugMode) {
      print('sub create state');
    }
    return SubState();
  }
}

/// 创建子组件状态管理类
class SubState extends State<SubLifecycleStatefulWidget> {
  String name = 'sub test';

  @override
  initState() {
    if (kDebugMode) {
      print('sub init state');
    }
    super.initState();
  }

  @override
  didChangeDependencies() {
    if (kDebugMode) {
      print('sub did change dependencies');
    }
    super.didChangeDependencies();
  }

  @override
  didUpdateWidget(SubLifecycleStatefulWidget oldWidget) {
    if (kDebugMode) {
      print('sub did update widget');
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  deactivate() {
    if (kDebugMode) {
      print('sub deactivate');
    }
    super.deactivate();
  }

  @override
  dispose() {
    if (kDebugMode) {
      print('sub dispose');
    }
    super.dispose();
  }

  @override
  reassemble() {
    if (kDebugMode) {
      print('sub reassemble');
    }
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('sub build');
    }
    return Center(child: Text('sub-name $name')); // 使用Text组件显示当前name state
  }
}
