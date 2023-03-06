import 'package:flutter/material.dart';
import 'package:flutter_basic/common.dart';

//手势
import 'package:flutter_basic/widget_gesture/02_gesture_detector.dart';
import 'package:flutter_basic/widget_gesture/07_inkwell.dart';
import 'package:flutter_basic/widget_gesture/05_dismissible-item.dart';
import 'package:flutter_basic/widget_gesture/04_draw-signature.dart';
import 'package:flutter_basic/widget_gesture/01_listener.dart';
import 'package:flutter_basic/widget_gesture/06-dragable.dart';
import 'package:flutter_basic/widget_gesture/03_raw_gesture_detector.dart';


List<RoutePage> _buildRoutes() {
  return [
    //basic gesture
    RoutePage("原始事件处理", (context) => buildTouchEventListenerWidget()),
    RoutePage("GestureDetector", (context) => buildGestureDetectorWidget()),
    RoutePage("RawGestureDetector", (context) => buildDoubleGestureWidget()),
    RoutePage("InkWell", (context) => buildInkWellWidget()),
    RoutePage("Dismissible", (context) => buildDismissibleWidget()),
    RoutePage("Drawable", (context) => buildDrawableWidget()),
    RoutePage("Dragable", (context) => buildDragableWidget()),
  ];
}

Widget buildGesturePagesWidget(BuildContext context) =>
    buildListBody("手势", context, _buildRoutes());