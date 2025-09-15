import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart' as sizer;

import '../../../../component/config/app_style.dart';
import 'detail_controller.dart';

class DetailTabScreen extends GetView<DetailController> {
  const DetailTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _tabSection(),
      ],
    );
  }

  Widget _tabSection() {
    return OrientationBuilder(builder: (context, orientation) {
      double isHeight = 40;
      double fontSize = 16;

      if (orientation == Orientation.portrait) {
        if (sizer.Device.screenType == sizer.ScreenType.mobile) {
          isHeight = 40;
          fontSize = 16;
        } else {
          isHeight = 40;
          fontSize = 16;
        }
      } else {
        isHeight = 40;
        fontSize = 16;
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: 35,
          child: Row(children: [
            _aboutButton(isHeight, fontSize),
            _baseStatsButton(isHeight, fontSize),
            _evolutionButton(isHeight, fontSize),
            _movesButton(isHeight, fontSize),
          ]),
        ),
      );
    });
  }

  Widget _aboutButton(double height, double fontSize) {
    return GetBuilder<DetailController>(builder: (ctrl) {
      final text = 'About';
      final textStyle = AppStyle.bold(
        size: fontSize,
        textColor:
            ctrl.selectedScreen == 0 ? AppStyle.textColor : AppStyle.grey3,
      );

      final textPainter = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      final textWidth = textPainter.width + 10;

      return Expanded(
        child: GestureDetector(
          onTap: () => ctrl.setSelectedScreen(0),
          child: SizedBox(
            height: height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(text, style: textStyle),
                  Container(
                    height: 2,
                    width: textWidth,
                    color: ctrl.selectedScreen == 0
                        ? AppStyle.blue1
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _baseStatsButton(double height, double fontSize) {
    return GetBuilder<DetailController>(builder: (ctrl) {
      final text = 'Base Stats';
      final textStyle = AppStyle.bold(
        size: fontSize,
        textColor:
            ctrl.selectedScreen == 1 ? AppStyle.textColor : AppStyle.grey3,
      );

      final textPainter = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      final textWidth = textPainter.width + 10;

      return Expanded(
        child: GestureDetector(
          onTap: () => ctrl.setSelectedScreen(1),
          child: SizedBox(
            height: height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(text, style: textStyle),
                  Container(
                    height: 2,
                    width: textWidth,
                    color: ctrl.selectedScreen == 1
                        ? AppStyle.blue1
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _evolutionButton(double height, double fontSize) {
    return GetBuilder<DetailController>(builder: (ctrl) {
      final text = 'Evolution';
      final textStyle = AppStyle.bold(
        size: fontSize,
        textColor:
            ctrl.selectedScreen == 2 ? AppStyle.textColor : AppStyle.grey3,
      );

      final textPainter = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      final textWidth = textPainter.width + 10;

      return Expanded(
        child: GestureDetector(
          onTap: () => ctrl.setSelectedScreen(2),
          child: SizedBox(
            height: height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(text, style: textStyle),
                  Container(
                    height: 2,
                    width: textWidth,
                    color: ctrl.selectedScreen == 2
                        ? AppStyle.blue1
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _movesButton(double height, double fontSize) {
    return GetBuilder<DetailController>(builder: (ctrl) {
      final text = 'Moves';
      final textStyle = AppStyle.bold(
        size: fontSize,
        textColor:
            ctrl.selectedScreen == 3 ? AppStyle.textColor : AppStyle.grey3,
      );

      final textPainter = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      final textWidth = textPainter.width + 10;

      return Expanded(
        child: GestureDetector(
          onTap: () => ctrl.setSelectedScreen(3),
          child: SizedBox(
            height: height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(text, style: textStyle),
                  Container(
                    height: 2,
                    width: textWidth,
                    color: ctrl.selectedScreen == 3
                        ? AppStyle.blue1
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
