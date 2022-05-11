import 'dart:async';

import 'package:flutter/foundation.dart';

class Debounce {
  final int seconds;
  VoidCallback? action;
  Timer? _timer;

  Debounce({ required this.seconds });

  run(VoidCallback action) {
    _timer = Timer(Duration(seconds: seconds), action);
  }
}