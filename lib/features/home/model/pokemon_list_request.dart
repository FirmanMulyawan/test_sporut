class PokemonListRequest {
  int? offset;
  int? limit;

  PokemonListRequest({this.offset, this.limit});

  PokemonListRequest.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['limit'] = limit;
    return data;
  }
}
