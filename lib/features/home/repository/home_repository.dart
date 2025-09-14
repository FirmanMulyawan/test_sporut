import '../../../component/base/base_repository.dart';
import '../model/pokemon_detail_response.dart';
import '../model/pokemon_list_request.dart';
import '../model/pokemon_list_response.dart';
import 'home_datasource.dart';

class HomeRepository extends BaseRepository {
  final HomeDatasource _dataSource;

  HomeRepository(this._dataSource);

  Future<List<ListsPokemon>> getListPokemon(
      {required PokemonListRequest request}) async {
    final data =
        _dataSource.getListPokemon(request).then(mapToData).then((value) {
      final response = PokemonListResponse.fromJson(value);
      List<ListsPokemon> list = [];
      response.results?.forEach((e) => list.add(e));
      return list;
    });

    return data;
  }

  Future<PokemonDetailResponse> getPokemonDetail(String url) async {
    final data = await _dataSource.getPokemonDetail(url).then(mapToData);
    return PokemonDetailResponse.fromJson(data);
  }
}
