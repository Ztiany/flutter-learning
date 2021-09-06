import 'package:flutter/material.dart';
import 'package:flutter_basic/common.dart';

//网络
import 'package:flutter_basic/ability_network/01_httpclient.dart';
import 'package:flutter_basic/ability_network/02_http_sample1.dart';
import 'package:flutter_basic/ability_network/02_http_sample2.dart';
import 'package:flutter_basic/ability_network/03-dio.dart';
import 'package:flutter_basic/ability_network/04-json-convert.dart';
import 'package:flutter_basic/ability_network/07_web_socket.dart';

List<RoutePage> _buildRoutes() {
  return [
    //net work
    RoutePage("HttpClient", (context) => buildHttpClientWidget()),
    RoutePage("Http Sampe1", (context) => buildHttpSample1Widget()),
    RoutePage("Http Sampe2", (context) => buildHttpSample2Widget()),
    RoutePage("Dio Sampe", (context) => buildDioDemoWidget()),
    RoutePage("Json Parse", (context) => buildJsonParsingDemo()),
  ];
}

Widget buildNetworkPagesWidget(BuildContext context) =>
    buildListBody("网络", context, _buildRoutes());