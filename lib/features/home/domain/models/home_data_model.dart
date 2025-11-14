import 'pokemon_model.dart';

class HomeDataModel {
  final List<PokemonModel> allPokemons;
  final List<PokemonModel> filteredPokemons;
  final bool hasFilter;

  HomeDataModel({
    required this.allPokemons,
    required this.filteredPokemons,
    required this.hasFilter,
  });

  HomeDataModel copyWith({
    List<PokemonModel>? allPokemons,
    List<PokemonModel>? filteredPokemons,
    bool? hasFilter,
  }) {
    return HomeDataModel(
      allPokemons: allPokemons ?? this.allPokemons,
      filteredPokemons: filteredPokemons ?? this.filteredPokemons,
      hasFilter: hasFilter ?? this.hasFilter,
    );
  }
}
