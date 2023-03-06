import 'package:flutter/material.dart';
import 'package:flutter_basic/common.dart';
import 'package:flutter_basic/widget_tools/theme_widget.dart';
import 'package:flutter_basic/widget_tools/understand_provider.dart';

import 'dialogs.dart';
import 'inherited_widget.dart';
import 'will_pop_scope_widget.dart';

List<RoutePage> _buildRoutes() {
  return [
    RoutePage("WillPopScope", (context) => buildWillPopScopeWidgetSample()),
    RoutePage("Theme", (context) => buildThemeDemo()),
    RoutePage("Inherited", (context) => buildInheritedWidget()),
    RoutePage("Understad Provider", (context) => buildProviderUnderstandingWidget()),
    RoutePage("Dialogs", (context) => buildDialogSampleWidget()),
  ];
}

Widget buildToolsPagesWidget(BuildContext context) =>
    buildListBody("Tools", context, _buildRoutes());