import '../../../component/base/base_repository.dart';
import '../../../component/util/state.dart';
// import '../model/gender_response.dart';
import '../model/species_response.dart';
import 'about_datasource.dart';

class AboutRepository extends BaseRepository {
  final AboutDatasource _dataSource;

  AboutRepository(this._dataSource);

  // void getGender(
  //     {required String id,
  //     required ResponseHandler<PokemonGenderResponse> response}) async {
  //   try {
  //     final data =
  //         await _dataSource.getGender(id).then(mapToData).then((value) {
  //       final response = PokemonGenderResponse.fromJson(value);
  //       return response;
  //     });

  //     response.onSuccess.call(data);
  //     response.onDone.call();
  //   } catch (e, _) {
  //     response.onFailed(e, e.toString());
  //     response.onDone.call();
  //   }
  // }

  void getSpecies(
      {required String id,
      required ResponseHandler<SpeciesResponse> response}) async {
    try {
      final data =
          await _dataSource.getSpecies(id).then(mapToData).then((value) {
        final response = SpeciesResponse.fromJson(value);
        return response;
      });

      response.onSuccess.call(data);
      response.onDone.call();
    } catch (e, _) {
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }
}
