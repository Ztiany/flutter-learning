import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'dart:math';

/// 初始
final store = Store<NameStates>(reducer, initialState: NameStates.initState());

Widget buildReduceNameGameWidget() => StoreProvider(
    store: store,
    child: Scaffold(
      appBar: AppBar(title: const Text("buildInheritedNameGameWidget")),
      body: NameGame(store: store),
    ));

/// 测试随机名字游戏组件
class NameGame extends StatelessWidget {
  /// store
  final Store store;

  /// 构造函数
  const NameGame({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Welcome(store: store),
        RandomName(store: store),
        const TestOther(),
      ],
    );
  }
}

/// name 状态管理类
class NameStates {
  final String _name;

  /// getter 方法获取name
  get name => _name;

  /// 构造函数
  NameStates(this._name);

  /// 初始设置
  NameStates.initState() : _name = 'test flutter 1';
}

/// 定义 name state 对应的状态修改 action
///
/// [NameActions.changeName] 为修改当前 name
enum NameActions {
  /// 修改 name 的 state
  changeName
}

/// reducer 方法，触发组件更新
NameStates reducer(NameStates state, action) {
  if (action == NameActions.changeName) {
    return changeName();
  }
  return state;
}

/// 修改当前name，随机选取一个
NameStates changeName() {
  List<String> nameList = ['flutter one', 'flutter two', 'flutter three'];
  int pos = Random().nextInt(3);
  return NameStates(nameList[pos]);
}

/// 随机展示人名
class RandomName extends StatelessWidget {
  /// store
  final Store store;

  /// 构造函数
  const RandomName({super.key, required this.store}) : super();

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('random name build');
    }
    return StoreConnector<NameStates, String>(
      converter: (store) => store.state.name.toString(),
      builder: (context, name) {
        return StoreConnector<NameStates, VoidCallback>(converter: (store) {
          return () => store.dispatch(NameActions.changeName);
        }, builder: (context, callback) {
          return TextButton(
            child: Text(name),
            onPressed: () => callback(),
          );
        });
      },
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
  /// store
  final Store store;

  /// 构造函数
  const Welcome({super.key, required this.store}) : super();

  /// 有状态类返回组件信息
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('welcome build');
    }
    return StoreConnector<NameStates, String>(
      converter: (store) => store.state.name.toString(),
      builder: (context, name) {
        return Text('欢迎 $name');
      },
    );
  }
}
