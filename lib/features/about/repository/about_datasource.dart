import '../../../component/base/base_dio_datasource.dart';
import '../../../component/ext/dio_ext.dart';

class AboutDatasource extends BaseDioDataSource {
  AboutDatasource(super.client);

  // Future<String> getGender(String id) {
  //   String path = '/gender/$id';
  //   return get<String>(path).load();
  // }

  Future<String> getSpecies(String id) {
    String path = '/pokemon-species/$id';
    return get<String>(path).load();
  }
}
