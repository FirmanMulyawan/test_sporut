import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../about/presentation/about_screen.dart';
import '../../base_stats/presentation/base_stats_screen.dart';
import '../../evolution/presentation/evolution_screen.dart';
import '../../home/model/pokemon_detail_response.dart';
import '../../moves/presentation/moves_screen.dart';

class DetailController extends GetxController {
  DetailController();

  PokemonDetailResponse? detailResponse;
  int selectedScreen = 0;
  late final List<Widget> screenList;

  @override
  void onInit() {
    super.onInit();
    detailResponse = Get.arguments;
    screenList = [
      const AboutScreen(),
      const BaseStatsScreen(),
      const EvolutionScreen(),
      const MovesScreen(),
    ];
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void setSelectedScreen(int value) {
    selectedScreen = value;
    update();
  }
}
