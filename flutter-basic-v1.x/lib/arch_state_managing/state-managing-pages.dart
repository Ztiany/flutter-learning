import 'package:flutter/material.dart';
import 'package:flutter_basic/common.dart';

//动画
import 'package:flutter_basic/arch_state_managing/01_self_managing_state.dart';
import 'package:flutter_basic/arch_state_managing/02_parent_managing_state.dart';
import 'package:flutter_basic/arch_state_managing/03_mix_managing_state.dart';
import 'package:flutter_basic/arch_state_managing/04_provider.dart';
import 'package:flutter_basic/arch_state_managing/05_provder_customer.dart';

List<RoutePage> _buildRoutes() {
  return [
    //Animation
    RoutePage("Selfe Managing", (context) => buildSelfManagingWidget()),
    RoutePage("Parent Managing", (context) => buildParentManagingWidget()),
    RoutePage("Mix Managing", (context) => buildMixManagingWidget()),
    RoutePage("Provider Demo", (context) => buildProviderDemoWidget()),
    RoutePage("Customer Demo", (context) => buildProviderCustomerDemoWidget()),
  ];
}

Widget buildStateManagingPagesWidget(BuildContext context) =>
    buildListBody("状态管理示例", context, _buildRoutes());
