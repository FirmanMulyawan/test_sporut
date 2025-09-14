import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/config/app_style.dart';
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

  Color getPokemonTypeColor(String type) {
    switch (type.toLowerCase()) {
      case "normal":
        return AppStyle.normal;
      case "fire":
        return AppStyle.fire;
      case "water":
        return AppStyle.water;
      case "electric":
        return AppStyle.electric;
      case "grass":
        return AppStyle.grass;
      case "ice":
        return AppStyle.ice;
      case "fighting":
        return AppStyle.fighting;
      case "poison":
        return AppStyle.poison;
      case "ground":
        return AppStyle.ground;
      case "flying":
        return AppStyle.flying;
      case "psychic":
        return AppStyle.psychic;
      case "bug":
        return AppStyle.bug;
      case "rock":
        return AppStyle.rock;
      case "ghost":
        return AppStyle.ghost;
      case "dragon":
        return AppStyle.dragon;
      case "dark":
        return AppStyle.dark;
      case "steel":
        return AppStyle.steel;
      case "fairy":
        return AppStyle.fairy;
      default:
        return AppStyle.grass;
    }
  }
}
