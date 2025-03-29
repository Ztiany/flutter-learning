import 'package:flutter/cupertino.dart';

void reportError(Object error, StackTrace stack) {
  debugPrint("reportError: error = $error, stack = $stack");
}
