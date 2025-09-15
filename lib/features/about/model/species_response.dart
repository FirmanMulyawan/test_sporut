class SpeciesResponse {
  int? baseHappiness;
  int? captureRate;
  List<EggGroups>? eggGroups;
  EvolutionChain? evolutionChain;
  bool? formsSwitchable;
  int? genderRate;
  EggGroups? generation;
  EggGroups? growthRate;
  EggGroups? habitat;
  bool? hasGenderDifferences;
  int? hatchCounter;
  int? id;
  bool? isBaby;
  bool? isLegendary;
  bool? isMythical;
  String? name;
  int? order;
  EggGroups? shape;
  List<Varieties>? varieties;

  SpeciesResponse(
      {this.baseHappiness,
      this.captureRate,
      this.eggGroups,
      this.evolutionChain,
      this.formsSwitchable,
      this.genderRate,
      this.generation,
      this.growthRate,
      this.habitat,
      this.hasGenderDifferences,
      this.hatchCounter,
      this.id,
      this.isBaby,
      this.isLegendary,
      this.isMythical,
      this.name,
      this.order,
      this.shape,
      this.varieties});

  SpeciesResponse.fromJson(Map<String, dynamic> json) {
    baseHappiness = json['base_happiness'];
    captureRate = json['capture_rate'];
    if (json['egg_groups'] != null) {
      eggGroups = <EggGroups>[];
      json['egg_groups'].forEach((v) {
        eggGroups!.add(EggGroups.fromJson(v));
      });
    }
    evolutionChain = json['evolution_chain'] != null
        ? EvolutionChain.fromJson(json['evolution_chain'])
        : null;
    formsSwitchable = json['forms_switchable'];
    genderRate = json['gender_rate'];
    generation = json['generation'] != null
        ? EggGroups.fromJson(json['generation'])
        : null;
    growthRate = json['growth_rate'] != null
        ? EggGroups.fromJson(json['growth_rate'])
        : null;
    habitat =
        json['habitat'] != null ? EggGroups.fromJson(json['habitat']) : null;
    hasGenderDifferences = json['has_gender_differences'];
    hatchCounter = json['hatch_counter'];
    id = json['id'];
    isBaby = json['is_baby'];
    isLegendary = json['is_legendary'];
    isMythical = json['is_mythical'];
    name = json['name'];
    order = json['order'];
    shape = json['shape'] != null ? EggGroups.fromJson(json['shape']) : null;
    if (json['varieties'] != null) {
      varieties = <Varieties>[];
      json['varieties'].forEach((v) {
        varieties!.add(Varieties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_happiness'] = baseHappiness;
    data['capture_rate'] = captureRate;
    if (eggGroups != null) {
      data['egg_groups'] = eggGroups!.map((v) => v.toJson()).toList();
    }
    if (evolutionChain != null) {
      data['evolution_chain'] = evolutionChain!.toJson();
    }
    data['forms_switchable'] = formsSwitchable;
    data['gender_rate'] = genderRate;
    if (generation != null) {
      data['generation'] = generation!.toJson();
    }
    if (growthRate != null) {
      data['growth_rate'] = growthRate!.toJson();
    }
    if (habitat != null) {
      data['habitat'] = habitat!.toJson();
    }
    data['has_gender_differences'] = hasGenderDifferences;
    data['hatch_counter'] = hatchCounter;
    data['id'] = id;
    data['is_baby'] = isBaby;
    data['is_legendary'] = isLegendary;
    data['is_mythical'] = isMythical;
    data['name'] = name;
    data['order'] = order;
    if (shape != null) {
      data['shape'] = shape!.toJson();
    }
    if (varieties != null) {
      data['varieties'] = varieties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EggGroups {
  String? name;
  String? url;

  EggGroups({this.name, this.url});

  EggGroups.fromJson(Map<String, dynamic> json) {
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

class EvolutionChain {
  String? url;

  EvolutionChain({this.url});

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    return data;
  }
}

class Varieties {
  bool? isDefault;
  EggGroups? pokemon;

  Varieties({this.isDefault, this.pokemon});

  Varieties.fromJson(Map<String, dynamic> json) {
    isDefault = json['is_default'];
    pokemon =
        json['pokemon'] != null ? EggGroups.fromJson(json['pokemon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_default'] = isDefault;
    if (pokemon != null) {
      data['pokemon'] = pokemon!.toJson();
    }
    return data;
  }
}
