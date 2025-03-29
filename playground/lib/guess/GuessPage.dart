import 'dart:math';

import 'package:flutter/material.dart';
import 'GuessBar.dart';
import 'ResultNotice.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({super.key, required this.title});

  final String title;

  @override
  State<GuessPage> createState() => _GuessPagePageState();
}

class _GuessPagePageState extends State<GuessPage> {
  final Random _random = Random();

  int _value = 0;

  void _generateRandomNumber() {
    setState(() {
      _value = _random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuessAppBar(),

      body: Stack(
        children: [
          Column(
            children: [
              ResultNotice(color: Colors.redAccent, info: '大了'),
              ResultNotice(color: Colors.blueAccent, info: '小了'),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('点击生成随机数值'),
                Text(
                  '$_value',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomNumber,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
