import 'package:get/get.dart';

import '../../../component/util/helper.dart';
import '../../../component/util/state.dart';
import '../../detail/presentation/detail_controller.dart';
import '../../home/model/pokemon_detail_response.dart';
// import '../model/gender_response.dart';
import '../model/species_response.dart';
import '../repository/about_repository.dart';

class AboutController extends GetxController {
  final AboutRepository _repository;

  AboutController(this._repository);

  final detailCtrl = Get.find<DetailController>();

  PokemonDetailResponse? get detailResponse => detailCtrl.detailResponse;
  bool isLoading = true;
  // PokemonGenderResponse? dataGender;
  SpeciesResponse? dataSpecies;

  @override
  void onInit() {
    super.onInit();

    getSpecies(detailResponse?.id.toString() ?? '0');
  }

  // Future<void> getGender(String id) async {
  //   isLoading = true;
  //   update();
  //   _repository.getGender(
  //       id: id,
  //       response: ResponseHandler(onSuccess: (data) async {
  //         dataGender = data;
  //         update();
  //       }, onFailed: (responseError, message) async {
  //         AlertModel.showAlert(title: "Error", message: message);
  //       }, onDone: () {
  //         isLoading = false;
  //         update();
  //       }));
  // }

  Future<void> getSpecies(String id) async {
    isLoading = true;
    update();
    _repository.getSpecies(
        id: id,
        response: ResponseHandler(onSuccess: (data) async {
          dataSpecies = data;
          update();
        }, onFailed: (responseError, message) async {
          AlertModel.showAlert(title: "Error", message: message);
        }, onDone: () {
          isLoading = false;
          update();
        }));
  }
}
