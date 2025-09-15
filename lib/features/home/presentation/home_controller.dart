import 'dart:async';

import 'package:get/get.dart';

import '../../../component/widget/pagination_list_controller.dart';
import '../model/pokemon_detail_response.dart';
import '../model/pokemon_list_request.dart';
import '../repository/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;

  HomeController(this._repository);

  late final getItems =
      PaginationListController.fromFuture<PokemonDetailResponse>(
          handler: getItemsFunction);

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future<List<PokemonDetailResponse>?> getItemsFunction(
      RequestPagination request) async {
    final list = await _repository.getListPokemon(
        request: PokemonListRequest(limit: request.take, offset: request.page));

    List<PokemonDetailResponse> pokemons = [];
    if (list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        if (list[i].url != null) {
          final listDetail = await getPokemonDetail(list[i].url ?? '');
          pokemons.add(listDetail);
        }
      }
    }

    return pokemons;
  }

  Future<PokemonDetailResponse> getPokemonDetail(String url) async {
    final response = await _repository.getPokemonDetail(url);
    return response;
  }
}
