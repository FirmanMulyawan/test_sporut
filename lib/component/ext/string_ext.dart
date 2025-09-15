import 'package:flutter/material.dart';

import '../config/app_style.dart';

extension StringExt on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }

  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  Color getPokemonTypeColor() {
    switch (toLowerCase()) {
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
