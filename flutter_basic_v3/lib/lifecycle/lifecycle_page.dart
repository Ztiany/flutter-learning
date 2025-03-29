import 'package:flutter/material.dart';

import '../common.dart';
import 'app_lifecycle_stateful_widget.dart';
import 'lifecycle_stateful_widget.dart';

Widget buildLifecyclePagesWidget(BuildContext context) {
  return buildListBodyWithTitle("生命周期", context, _buildRoutes(), listSpanSize: 2);
}

List<RoutePage> _buildRoutes() {
  return [
    RoutePage("组件生命周期", (context) => _buildWidgetLifecyclePage()),
    RoutePage("APP 生命周期", (context) => _buildAppLifecyclePage()),
  ];
}

Widget _buildWidgetLifecyclePage() {
  return buildBodyWithTitle("组件生命周期", const LifecycleStatefulWidget());
}

Widget _buildAppLifecyclePage() {
  return buildBodyWithTitle("APP 生命周期", const AppLifecycleStatefulWidget());
}
