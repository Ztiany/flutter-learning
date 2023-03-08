import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// name 状态管理模块
class NameModel with ChangeNotifier {
  /// 声明私有变量
  String _name = 'test flutter';

  /// 设置 get 方法
  String get value => _name;

  /// 修改当前 name，随机选取一个
  void changeName() {
    List<String> nameList = ['flutter one', 'flutter two', 'flutter three'];
    int pos = Random().nextInt(3);
    if (_name != nameList[pos]) {
      _name = nameList[pos];
      notifyListeners();
    }
  }
}

/// 随机展示人名
class RandomName extends StatelessWidget {
  const RandomName({super.key});

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    final name = Provider.of<NameModel>(context);
    if (kDebugMode) {
      print('random name build');
    }
    return TextButton(
      child: Text(name.value),
      onPressed: () => name.changeName(),
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
    final name = Provider.of<NameModel>(context);
    if (kDebugMode) {
      print('welcome build');
    }
    return Text('欢迎 ${name.value}');
  }
}

Widget buildProviderNameGameWidget() => ChangeNotifierProvider<NameModel>(
    create: (_) => NameModel(),
    child: Scaffold(
      appBar: AppBar(title: const Text("Provider")),
      body: const NameGame(),
    ));

/// 测试随机名字游戏组件
class NameGame extends StatelessWidget {
  const NameGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //需要更新的区域
        Consumer<NameModel>(builder: (context, provider, child) {
          return Column(
            children: const <Widget>[
              Welcome(),
              RandomName(),
            ],
          );
        }),

        //不需要更新的区域
        const TestOther(),
      ],
    );
  }
}
