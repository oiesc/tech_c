/// Constantes reutilizáveis para testes do módulo Home
class HomeTestConstants {
  // Dados mock de resposta da API completa
  static const mockApiPokemonData = {
    'pokemon': [
      {
        'id': 1,
        'num': '001',
        'name': 'Bulbasaur',
        'img': 'http://example.com/bulbasaur.png',
        'type': ['Grass', 'Poison'],
        'height': '0.71 m',
        'weight': '6.9 kg',
        'candy': 'Bulbasaur Candy',
        'candy_count': 25,
        'egg': '2 km',
        'spawn_chance': 0.69,
        'avg_spawns': 69,
        'spawn_time': '20:00',
        'multipliers': [1.58],
        'weaknesses': ['Fire', 'Ice', 'Flying', 'Psychic'],
        'prev_evolution': null,
        'next_evolution': [
          {'num': '002', 'name': 'Ivysaur'}
        ]
      },
      {
        'id': 2,
        'num': '002',
        'name': 'Ivysaur',
        'img': 'http://example.com/ivysaur.png',
        'type': ['Grass', 'Poison'],
        'height': '0.99 m',
        'weight': '13.0 kg',
        'candy': 'Bulbasaur Candy',
        'candy_count': 100,
        'egg': '2 km',
        'spawn_chance': 0.042,
        'avg_spawns': 4.2,
        'spawn_time': '07:00',
        'multipliers': [1.2, 1.6],
        'weaknesses': ['Fire', 'Ice', 'Flying', 'Psychic'],
        'prev_evolution': [
          {'num': '001', 'name': 'Bulbasaur'}
        ],
        'next_evolution': [
          {'num': '003', 'name': 'Venusaur'}
        ]
      },
      {
        'id': 25,
        'num': '025',
        'name': 'Pikachu',
        'img': 'http://example.com/pikachu.png',
        'type': ['Electric'],
        'height': '0.41 m',
        'weight': '6.0 kg',
        'candy': 'Pikachu Candy',
        'candy_count': 50,
        'egg': '2 km',
        'spawn_chance': 0.21,
        'avg_spawns': 21,
        'spawn_time': '04:58',
        'multipliers': [2.34],
        'weaknesses': ['Ground'],
        'prev_evolution': [
          {'num': '172', 'name': 'Pichu'}
        ],
        'next_evolution': [
          {'num': '026', 'name': 'Raichu'}
        ]
      }
    ]
  };

  // Dados para testes de API response vazia
  static const emptyApiResponse = {'pokemon': <dynamic>[]};

  // Dados para testes de API response com dados mínimos
  static const minimalApiResponse = {
    'pokemon': [
      {
        'id': 1,
        'num': '001',
        'name': 'TestPokemon',
        'img': 'http://example.com/test.png',
        'type': ['Normal'],
        'height': '1.0 m',
        'weight': '10.0 kg',
        'candy': 'Test Candy',
        'egg': '2 km',
        'spawn_chance': 1.0,
        'avg_spawns': 100,
        'spawn_time': '12:00',
        'multipliers': [1.0],
        'weaknesses': ['Fighting'],
        'prev_evolution': null,
        'next_evolution': null
      }
    ]
  };

  // Dados para testes de API response com null evolutions
  static const nullEvolutionApiResponse = {
    'pokemon': [
      {
        'id': 1,
        'num': '001',
        'name': 'TestPokemon',
        'img': 'http://example.com/test.png',
        'type': ['Normal'],
        'height': '1.0 m',
        'weight': '10.0 kg',
        'candy': 'Test Candy',
        'candy_count': 25,
        'egg': '2 km',
        'spawn_chance': 1.0,
        'avg_spawns': 100,
        'spawn_time': '12:00',
        'multipliers': [1.0],
        'weaknesses': ['Fighting'],
        'prev_evolution': null,
        'next_evolution': null
      }
    ]
  };
}