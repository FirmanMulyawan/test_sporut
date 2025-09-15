import 'package:get/get.dart';

import '../../../component/util/network.dart';
import '../../about/presentation/about_controller.dart';
import '../../about/repository/about_datasource.dart';
import '../../about/repository/about_repository.dart';
import '../../base_stats/presentation/base_stats_controller.dart';
import '../../evolution/presentation/evolution_controller.dart';
import '../../moves/presentation/moves_controller.dart';
import '../presentation/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());

    Get.lazyPut(() => AboutController(Get.find()));
    Get.lazyPut(() => AboutDatasource(Network.dioClient()));
    Get.lazyPut(() => AboutRepository(Get.find()));

    Get.lazyPut(() => BaseStatsController());
    Get.lazyPut(() => EvolutionController());
    Get.lazyPut(() => MovesController());
  }
}
