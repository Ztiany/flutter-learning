import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry/sentry.dart';

import 'package:two_you_friend/util/tools/report.dart';

/// 判断当前环境类型
const bool inProduction = bool.fromEnvironment("dart.vm.product");

/// app错误上报服务
///
/// 上报客户端各类异常问题，并且防止出现 crash 问题
class AppSentry {
  /// catch 组件异常
  ///
  /// 开发模式下，本地打印，上线时则调用 sentry 平台
  static void runWithCatchError(Widget appMain) {
    // 1 在 Flutter 中可以通过 FlutterError 来捕获到运行期间的错误，包括构建期间、布局期间和绘制期间。
    //    捕获并上报 Flutter 异常
    // 2 FlutterError.onError 来捕获异常，这里会判断是否在正式环境，如果是则在本地打印错误日志，如果不是则去执行 runZonedGuarded onError 逻辑。
    // 在 runZonedGuarded 代码中执行 runApp，遇到异常时则调用 _reportError 实现错误上报
    FlutterError.onError = (FlutterErrorDetails details) async {
      if (!inProduction) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        Zone.current.handleUncaughtError(details.exception, details.stack);
      }
    };

    // runZonedGuarded 则是使用 Zone.fork 创建一片新的区域去运行代码逻辑，也就是 runApp，当遇到错误时会执行其回调函数 onError，
    // 其次如果在项目中使用了 Zone.current.handleUncaughtError 也会将错误抛出执行 onError 逻辑
    runZonedGuarded<Future<Null>>(() async {
      // Sentry 是一个异常收集 SDK
      await Sentry.init(
        (options) {
          options.dsn = 'https://f886adfd35e64062b01feb5e9a8723f6@o425523.ingest.sentry.io/5362342';
        },
      );
      runApp(appMain);
      Report.start();
    }, (error, stackTrace) async {
      await _reportError(error, stackTrace);
    });
  }

  /// 上报异常的函数
  static Future<void> _reportError(dynamic error, dynamic stackTrace) async {
    if (!inProduction) {
      // 判断是否为正式环境
      print(stackTrace);
    }
    // sentry 上报
    final sentryId = await Sentry.captureException(
      error,
      stackTrace: stackTrace,
    );

    print('Success! Event ID: ${sentryId}');
  }
}
