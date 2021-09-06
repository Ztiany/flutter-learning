import 'package:flutter/material.dart';
import 'package:flutter_basic/common.dart';

//动画
import 'package:flutter_basic/ability_storage/01_store_by_files.dart';
import 'package:flutter_basic/ability_storage/02_storage_by_sp.dart';
import 'package:flutter_basic/ability_storage/03_storage_by_sql.dart';

List<RoutePage> _buildRoutes() {
  return [
    //Animation
    RoutePage("Store by File", (context) => buildStoreByFilesDemo()),
    RoutePage("Store by Sp", (context) => buildStoreBySpDemo()),
    RoutePage("Store by DB", (context) => buildStoreByDBDemo()),
  ];
}

Widget buildStoragePagesWidget(BuildContext context) =>
    buildListBody("存储示例", context, _buildRoutes());