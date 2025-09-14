import '../../../component/ext/dio_ext.dart';
import '../../../component/base/base_dio_datasource.dart';
import '../model/pokemon_list_request.dart';

class HomeDatasource extends BaseDioDataSource {
  HomeDatasource(super.client);

  Future<String> getListPokemon(PokemonListRequest req) {
    String path = '/pokemon';

    Map<String, dynamic> query = {"offset": req.offset, "limit": req.limit};

    return get<String>(path, queryParameters: query).load();
  }

  Future<String> getPokemonDetail(String url) {
    return getFullUrl<String>(url).load();
  }
}
