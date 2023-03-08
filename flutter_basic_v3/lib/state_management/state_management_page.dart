import 'package:flutter/material.dart';
import 'package:flutter_basic_v3/state_management/inherited_widget_page.dart';
import 'package:flutter_basic_v3/state_management/provider_page.dart';
import 'package:flutter_basic_v3/state_management/redux_page.dart';

import '../common.dart';

List<RoutePage> _buildRoutes() {
  return [
    RoutePage("Inherited", (context) => buildInheritedNameGameWidget()),
    RoutePage("Redux", (context) => buildReduxNameGameWidget()),
    RoutePage("Provider", (context) => buildProviderNameGameWidget()),
  ];
}

Widget buildStateManagementPagesWidget(BuildContext context) => buildListBodyWithTitle("状态管理", context, _buildRoutes());
