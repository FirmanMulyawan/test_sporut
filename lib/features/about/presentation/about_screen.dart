import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart' as sizer;
import 'package:skeletonizer/skeletonizer.dart';

import '../../../component/config/app_style.dart';
import 'about_controller.dart';

class AboutScreen extends GetView<AboutController> {
  const AboutScreen({super.key});

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

      return GetBuilder<AboutController>(builder: (ctrl) {
        final isLoading = ctrl.isLoading;
        final dataSpecies = ctrl.dataSpecies;
        final detailResponse = ctrl.detailResponse;
        final dataGender = getGenderRate(ctrl.dataSpecies?.genderRate ?? 0);

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Skeletonizer(
                  enabled: isLoading,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _cardAbout(title: 'Species'),
                      SizedBox(
                        height: 5,
                      ),
                      _cardAbout(
                          title: "Height",
                          value: formatHeight(detailResponse?.height ?? 0)),
                      SizedBox(
                        height: 5,
                      ),
                      _cardAbout(
                          title: "Weight",
                          value: formatWeight(detailResponse?.weight ?? 0)),
                      SizedBox(
                        height: 5,
                      ),
                      _cardAbout(
                        title: "Abilities",
                        value: detailResponse?.abilities
                                ?.map((el) => el.ability?.name ?? '')
                                .where((name) => name.isNotEmpty)
                                .join(', ') ??
                            '-',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Breeding",
                        style: AppStyle.bold(size: 16),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _cardGender(
                          title: "Gender",
                          male: "${dataGender["male"]}%",
                          female: "${dataGender["female"]}%"),
                      SizedBox(
                        height: 5,
                      ),
                      _cardAbout(
                        title: "Egg Groups",
                        value: dataSpecies?.eggGroups
                                ?.map((el) => el.name ?? '')
                                .where((name) => name.isNotEmpty)
                                .join(', ') ??
                            '-',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      _cardAbout(
                        title: "Egg Cycle",
                      ),
                    ],
                  )),
            ],
          ),
        );
      });
    });
  }

  Widget _cardAbout({String title = '', String value = ''}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppStyle.medium(textColor: AppStyle.grey3),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            value,
            style: AppStyle.medium(),
          ),
        ),
      ],
    );
  }

  Widget _cardGender(
      {String title = '', String male = '', String female = ''}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppStyle.medium(textColor: AppStyle.grey3),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Icon(Icons.male, color: Colors.blue),
              Text(
                male,
                style: AppStyle.medium(),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(Icons.female, color: Colors.pink),
              Text(
                female,
                style: AppStyle.medium(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ====  helper
  String formatHeight(int heightDecimeter) {
    double heightMeters = heightDecimeter / 10;

    double heightFeetTotal = heightMeters * 3.28084;
    int feet = heightFeetTotal.floor();

    double inchesDecimal = (heightFeetTotal - feet) * 12;
    String inches = inchesDecimal.toStringAsFixed(1); // 1 desimal

    return "$feet′$inches″ (${heightMeters.toStringAsFixed(2)} m)";
  }

  String formatWeight(int weightHectogram) {
    double kg = weightHectogram / 10;
    double lbs = kg * 2.20462;

    return "${lbs.toStringAsFixed(1)} lbs (${kg.toStringAsFixed(1)} kg)";
  }

  Map<String, double> getGenderRate(int genderRate) {
    if (genderRate == -1) {
      return {
        "male": 0.0,
        "female": 0.0,
        "genderless": 100.0,
      };
    }

    double femaleChance = (genderRate / 8) * 100;
    double maleChance = 100 - femaleChance;

    return {
      "male": maleChance,
      "female": femaleChance,
    };
  }
}
