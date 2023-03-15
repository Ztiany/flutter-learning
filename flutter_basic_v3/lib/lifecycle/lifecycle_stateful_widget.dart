import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_v3/common.dart';

import 'sublifecycle_stateful_widget.dart';

/// 创建有状态测试组件
class LifecycleStatefulWidget extends StatefulWidget {
  const LifecycleStatefulWidget({super.key});

  @override
  // ignore: no_logic_in_create_state
  createState() {
    if (kDebugMode) {
      print('create state');
    }
    return _State();
  }
}

/// 创建状态管理类，继承状态测试组件
class _State extends State<LifecycleStatefulWidget> {
  /// 定义 state [count] 计算器
  int count = 1;

  /// 定义 state [name] 为当前描述字符串
  final String name = 'count';

  @override
  initState() {
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
  didUpdateWidget(LifecycleStatefulWidget oldWidget) {
    count++;
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
  }

  @override
  reassemble() {
    if (kDebugMode) {
      print('reassemble');
    }
    super.reassemble();
  }

  /// 修改 state name
  void changeName() {
    setState(() {
      if (kDebugMode) {
        print('set state');
      }
      count++;
    });
  }

  void _openSubpage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => buildBodyWithTitle("组件生命周期-Sub", const SubLifecycleStatefulWidget())));
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build');
    }
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          child: Text('$name: $count'), // 使用 Text 组件显示描述字符和当前计算
          onPressed: () => changeName(), // 点击触发修改描述字符 state name
        ),
        OutlinedButton(
          child: const Text('Open SubPage'), // 使用 Text 组件显示描述字符和当前计算
          onPressed: () => _openSubpage(context), // 点击触发修改描述字符 state name
        ),
      ],
    ));
  }
}
