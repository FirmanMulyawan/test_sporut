class PokemonHomeResponse {
  String? name;
  List<TypesPokemon>? types;

  PokemonHomeResponse({this.name, this.types});

  PokemonHomeResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['types'] != null) {
      types = <TypesPokemon>[];
      json['types'].forEach((v) {
        types!.add(TypesPokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TypesPokemon {
  int? slot;
  TypeDetail? type;

  TypesPokemon({this.slot, this.type});

  TypesPokemon.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? TypeDetail.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}

class TypeDetail {
  String? name;
  String? url;

  TypeDetail({this.name, this.url});

  TypeDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
