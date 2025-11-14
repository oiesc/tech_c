import 'package:techc/features/home/domain/models/pokemon_model.dart';

/// Helpers para criar objetos de teste a partir das constantes
class HomeTestHelpers {
  /// Cria uma lista de PokemonModel padrão para testes
  static List<PokemonModel> createMockPokemonList() {
    return [
      PokemonModel(
        id: 1,
        number: '001',
        name: 'Bulbasaur',
        img: 'http://example.com/bulbasaur.png',
        type: ['Grass', 'Poison'],
        height: '0.71 m',
        weight: '6.9 kg',
        candy: 'Bulbasaur Candy',
        candyCount: 25,
        egg: '2 km',
        spawnChance: 0.69,
        avgSpawns: 69,
        spawnTime: '20:00',
        multipliers: [1.58],
        weaknesses: ['Fire', 'Ice', 'Flying', 'Psychic'],
        prevEvolution: [],
        nextEvolution: [EvolutionModel(number: '002', name: 'Ivysaur')],
      ),
      PokemonModel(
        id: 2,
        number: '002',
        name: 'Ivysaur',
        img: 'http://example.com/ivysaur.png',
        type: ['Grass', 'Poison'],
        height: '0.99 m',
        weight: '13.0 kg',
        candy: 'Bulbasaur Candy',
        candyCount: 100,
        egg: '2 km',
        spawnChance: 0.042,
        avgSpawns: 4.2,
        spawnTime: '07:00',
        multipliers: [1.2, 1.6],
        weaknesses: ['Fire', 'Ice', 'Flying', 'Psychic'],
        prevEvolution: [EvolutionModel(number: '001', name: 'Bulbasaur')],
        nextEvolution: [EvolutionModel(number: '003', name: 'Venusaur')],
      ),
      PokemonModel(
        id: 25,
        number: '025',
        name: 'Pikachu',
        img: 'http://example.com/pikachu.png',
        type: ['Electric'],
        height: '0.41 m',
        weight: '6.0 kg',
        candy: 'Pikachu Candy',
        candyCount: 50,
        egg: '2 km',
        spawnChance: 0.21,
        avgSpawns: 21,
        spawnTime: '04:58',
        multipliers: [2.34],
        weaknesses: ['Ground'],
        prevEvolution: [EvolutionModel(number: '172', name: 'Pichu')],
        nextEvolution: [EvolutionModel(number: '026', name: 'Raichu')],
      ),
    ];
  }

  /// Cria uma lista menor de PokemonModel para testes específicos
  static List<PokemonModel> createSmallMockPokemonList() {
    return [
      PokemonModel(
        id: 1,
        number: '001',
        name: 'Bulbasaur',
        img: 'http://example.com/bulbasaur.png',
        type: ['Grass', 'Poison'],
        height: '0.71 m',
        weight: '6.9 kg',
        candy: 'Bulbasaur Candy',
        candyCount: 25,
        egg: '2 km',
        spawnChance: 0.69,
        avgSpawns: 69,
        spawnTime: '20:00',
        multipliers: [1.58],
        weaknesses: ['Fire', 'Ice', 'Flying', 'Psychic'],
        prevEvolution: [],
        nextEvolution: [EvolutionModel(number: '002', name: 'Ivysaur')],
      ),
      PokemonModel(
        id: 25,
        number: '025',
        name: 'Pikachu',
        img: 'http://example.com/pikachu.png',
        type: ['Electric'],
        height: '0.41 m',
        weight: '6.0 kg',
        candy: 'Pikachu Candy',
        candyCount: 50,
        egg: '2 km',
        spawnChance: 0.21,
        avgSpawns: 21,
        spawnTime: '04:58',
        multipliers: [2.34],
        weaknesses: ['Ground'],
        prevEvolution: [EvolutionModel(number: '172', name: 'Pichu')],
        nextEvolution: [EvolutionModel(number: '026', name: 'Raichu')],
      ),
    ];
  }

  /// Cria um único PokemonModel para testes unitários
  static PokemonModel createSinglePokemon() {
    return PokemonModel(
      id: 1,
      number: '001',
      name: 'Bulbasaur',
      img: 'http://example.com/bulbasaur.png',
      type: ['Grass', 'Poison'],
      height: '0.71 m',
      weight: '6.9 kg',
      candy: 'Bulbasaur Candy',
      candyCount: 25,
      egg: '2 km',
      spawnChance: 0.69,
      avgSpawns: 69,
      spawnTime: '20:00',
      multipliers: [1.58],
      weaknesses: ['Fire', 'Ice', 'Flying', 'Psychic'],
      prevEvolution: [],
      nextEvolution: [EvolutionModel(number: '002', name: 'Ivysaur')],
    );
  }

  /// Cria uma lista grande de PokemonModel para testes de performance
  static List<PokemonModel> createLargePokemonList({int count = 150}) {
    return List.generate(
      count,
      (index) => PokemonModel(
        id: index + 1,
        number: '${(index + 1).toString().padLeft(3, '0')}',
        name: 'Pokemon${index + 1}',
        img: 'http://example.com/pokemon${index + 1}.png',
        type: ['Normal'],
        height: '1.0 m',
        weight: '10.0 kg',
        candy: 'Pokemon Candy',
        candyCount: 25,
        egg: '2 km',
        spawnChance: 1.0,
        avgSpawns: 100,
        spawnTime: '12:00',
        multipliers: [1.0],
        weaknesses: ['Fighting'],
        prevEvolution: [],
        nextEvolution: [],
      ),
    );
  }
}