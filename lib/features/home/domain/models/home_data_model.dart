import 'pokemon_model.dart';

class HomeDataModel {
  final List<PokemonModel> allPokemons;
  final List<PokemonModel> filteredPokemons;

  HomeDataModel({
    required this.allPokemons,
    required this.filteredPokemons,
  });

  HomeDataModel copyWith({
    List<PokemonModel>? allPokemons,
    List<PokemonModel>? filteredPokemons,
  }) {
    return HomeDataModel(
      allPokemons: allPokemons ?? this.allPokemons,
      filteredPokemons: filteredPokemons ?? this.filteredPokemons,
    );
  }
}
