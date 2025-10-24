import 'package:flutter/material.dart';
import 'package:playground/infra_list_pager_builder.dart';
import 'package:playground/ui/component/text.dart';

List<PagerBuilder> get _builders => [
  PagerBuilder(title: 'Text', builder: (context) => textPager()),
];

Widget componentPager(BuildContext context) =>
    createPagerList("Base Component", context, _builders);
