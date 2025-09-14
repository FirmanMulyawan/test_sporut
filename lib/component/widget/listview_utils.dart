import 'package:flutter/material.dart';

extension ListViewUtils on ScrollController {
  VoidCallback onLoadMore(void Function() call) {
    var prevReached = false;
    void listener() {
      final reached = position.extentAfter < 120;
      if (reached && prevReached != reached) {
        call();
      }
      prevReached = reached;
    }

    addListener(listener);

    return () {
      removeListener(listener);
    };
  }
}
