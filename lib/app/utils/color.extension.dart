import 'package:flutter/cupertino.dart';

extension ColorExtend on Color? {
  String? get getHexColor =>
      this!.value.toRadixString(16).replaceRange(0, 1, "#");
}
