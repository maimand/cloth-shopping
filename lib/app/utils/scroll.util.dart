import 'dart:async';

import 'package:flutter/cupertino.dart';

class ScrollHelper {
  static void scrollToEnd(ScrollController scrollController) async {
    Timer(
      const Duration(milliseconds: 200),
          () => scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
