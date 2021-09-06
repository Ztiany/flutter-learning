import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_basic/widget_tools/widget_tools_pages.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/i18n.dart';

import 'common.dart';

import 'widget_animation/animation_pages.dart';
import 'arch_state_managing/counter_model.dart';
import 'widget_layout/layout_pages.dart';
import 'widget_list_scroll/list_pages.dart';
import 'widget_gesture/gesture_pages.dart';
import 'widget_basic/basic_widget_pages.dart';
import 'widget_custom/draw_pages.dart';

import 'arch_lifecycle/lifecycle_pages.dart';
import 'arch_navigator/navigation_pages.dart';
import 'arch_passing-value/pass_value_pages.dart';
import 'arch_state_managing/state-managing-pages.dart';

import 'ability_storage/storage_pages.dart';
import 'ability_network/networ_pages.dart';
import 'ability_platform-interact/platform_interact_pages.dart';

void main() {
  //重写错误处理
  FlutterError.onError = (FlutterErrorDetails details) async {
    // 转发至 Zone 中
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  //自定义错误界面
  /*ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails){
    print(flutterErrorDetails.toString());
    return Scaffold(
        body: Center(
          child: Text("Custom Error Widget"),
        )
    );
  };*/

  //以沙盒机制运行 app
  runZoned(() async {
    runApp(new FlutterBasicWidget());
  }, onError: (error) async {
    print("error: $error");
  });
}

List<RoutePage> _buildModulePages() {
  return [
    RoutePage("UI：基础组件", (context) => buildBasicWidgetPagesWidget(context)),
    RoutePage("UI：布局组件", (context) => buildLayoutPagesWidget(context)),
    RoutePage("UI：列表组件", (context) => buildListPagesWidget(context)),
    RoutePage("UI：动画组件", (context) => buildAnimationPagesWidget(context)),
    RoutePage("UI：手势组件", (context) => buildGesturePagesWidget(context)),
    RoutePage("UI：绘制组件", (context) => buildCustomViewPagesWidget(context)),
    RoutePage("UI：功能组件", (context) => buildToolsPagesWidget(context)),
    RoutePage("能力：存储", (context) => buildStoragePagesWidget(context)),
    RoutePage("能力：网络", (context) => buildNetworkPagesWidget(context)),
    RoutePage("能力：平台交互", (context) => buildPlatformInteractPagesWidget(context)),
    RoutePage("架构：状态管理", (context) => buildStateManagingPagesWidget(context)),
    RoutePage("架构：数据传递", (context) => buildPassValuePagesWidget(context)),
    RoutePage("架构：导航", (context) => buildNavigationPagesWidget(context)),
    RoutePage("架构：生命周期", (context) => buildLifecyclePagesWidget(context)),
  ];
}

class FlutterBasicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      //for demonstrate provider
        providers: [
          Provider.value(value: 30.0),
          ChangeNotifierProvider.value(value: CounterModel())
        ],

        // UI
        child: MaterialApp(

          //国际化翻译代理
          localizationsDelegates: [
            S.delegate,
            // ... app-specific localization delegate[s] here
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          //设置支持的语言
          supportedLocales: S.delegate.supportedLocales,
          //动态的设置title，便于国际化
          onGenerateTitle: (context) {
            return S
                .of(context)
                .app_title;
          },

          //性能检测开关
          checkerboardOffscreenLayers: false,
          checkerboardRasterCacheImages: false,

          /*配置App主题*/
          theme: ThemeData(
            //颜色模式，亮色、暗色
              brightness: Brightness.dark
          ),

          //首页
          home: buildListBody("Flutter", context, _buildModulePages()),
        ));

  }
}