import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart' as sizer;

import 'moves_controller.dart';

class MovesScreen extends GetView<MovesController> {
  const MovesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        if (sizer.Device.screenType == sizer.ScreenType.mobile) {
          // smartphone
        } else {
          // tablet
        }
      } else {
        // lanscape
      }

      return Container(child: Text("Moves"));
    });
  }
}
