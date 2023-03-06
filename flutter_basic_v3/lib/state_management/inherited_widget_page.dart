import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 定义一个 name 共享父组件
class NameInheritedWidget extends InheritedWidget {
  /// 共享状态
  final String name;

  /// 修改共享状态方法
  final Function onNameChange;

  /// 构造函数
  const NameInheritedWidget({
    super.key,
    required Widget child,
    required this.name,
    required this.onNameChange,
  }) : super(child: child);

  /*
  在执行 setState 后，NameInheritedWidget 会判断状态是否有状态变化，还会判断子组件是否有依赖该 name 状态，从而就保证了两点：
          状态变化时，如果未使用该状态子组件，则不会发生 build；
          使用了该状态组件，如果组件的状态没有发生变化，也不会发生 build。
   */
  @override
  bool updateShouldNotify(NameInheritedWidget oldWidget) {
    if (kDebugMode) {
      print(name != oldWidget.name);
    }
    return name != oldWidget.name;
  }
}

Widget buildInheritedNameGameWidget() => Scaffold(
      appBar: AppBar(title: const Text("buildInheritedNameGameWidget")),
      body: const NameGame(),
    );

/// 测试随机名字游戏组件
class NameGame extends StatefulWidget {
  /// 构造函数
  const NameGame({super.key});

  @override
  createState() => NameGameState();
}

/// 随机名字游戏组件状态管理类
class NameGameState extends State<NameGame> {
  /// name 状态
  late String name;

  /// 构造函数参数，避免父组件状态变化，而引起的子组件的重 build 操作
  late Widget child;

  /// 修改当前名字
  void changeName() {
    List<String> nameList = ['flutter one', 'flutter two', 'flutter three'];
    int pos = Random().nextInt(3);
    setState(() {
      name = nameList[pos];
    });
  }

  @override
  void initState() {
    setState(() {
      name = 'test flutter';
    });

    super.initState();
  }

  /// 构造函数
  NameGameState() {
    child = Column(children: const <Widget>[
      Welcome(),
      RandomName(),
      TestOther(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NameInheritedWidget(
          onNameChange: changeName,
          name: name,
          key: null,
          child: child,
        ),
      ],
    );
  }
}

/// 随机展示人名
class RandomName extends StatelessWidget {
  const RandomName({super.key});

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('random name  build');
    }
    //只要使用了 dependOnInheritedWidgetOfExactType 来获取依赖，就会导致依赖变更后子组件的更新。
    final String name = (context.dependOnInheritedWidgetOfExactType<NameInheritedWidget>() as NameInheritedWidget).name;
    final Function changeName = (context.dependOnInheritedWidgetOfExactType<NameInheritedWidget>() as NameInheritedWidget).onNameChange;

    return TextButton(
      child: Text(name),
      onPressed: () => changeName(),
    );
  }
}

/// 欢迎人展示组件
class TestOther extends StatelessWidget {
  const TestOther({super.key});

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('test other build');
    }
    return const Text('我是其他组件');
  }
}

/// 欢迎人展示组件
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('welcome build');
    }
    final name = (context.dependOnInheritedWidgetOfExactType<NameInheritedWidget>() as NameInheritedWidget).name;
    return Text('欢迎 $name');
  }
}
