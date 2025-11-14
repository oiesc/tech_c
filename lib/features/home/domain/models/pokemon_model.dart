class PokemonModel {
  int id;
  String number;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  double spawnChance;
  int avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<String> weaknesses;
  List<NextEvolutionModel> nextEvolution;

  PokemonModel({
    required this.id,
    required this.number,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      number: json['num'],
      name: json['name'],
      img: json['img'],
      type: List<String>.from(json['type']),
      height: json['height'],
      weight: json['weight'],
      candy: json['candy'],
      candyCount: json['candy_count'] ?? 0,
      egg: json['egg'],
      spawnChance: (json['spawn_chance'] as num).toDouble(),
      avgSpawns: json['avg_spawns'],
      spawnTime: json['spawn_time'],
      multipliers: json['multipliers'] != null
          ? List<double>.from((json['multipliers'] as List).map((x) => (x as num).toDouble()))
          : [],
      weaknesses: List<String>.from(json['weaknesses']),
      nextEvolution: json['next_evolution'] != null
          ? List<NextEvolutionModel>.from((json['next_evolution'] as List).map((x) => NextEvolutionModel.fromJson(x)))
          : [],
    );
  }
}

class NextEvolutionModel {
  String number;
  String name;

  NextEvolutionModel({
    required this.number,
    required this.name,
  });

  factory NextEvolutionModel.fromJson(Map<String, dynamic> json) {
    return NextEvolutionModel(
      number: json['num'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );
  }
}
