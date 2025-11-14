import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_c/features/home/domain/models/pokemon_model.dart';
import 'package:tech_c/features/home/infrastructure/repositories/home_repository.dart';
import 'package:tech_c/global/app_core/domain/models/either.dart';
import 'package:tech_c/global/app_core/failures/app_failure.dart';

import '../../../../mocks/home_mocks.mocks.dart';
import '../../../../mocks/home_test_constants.dart';

void main() {
  late HomeRepository repository;
  late MockHomeDatasource mockHomeDatasource;

  setUp(() {
    mockHomeDatasource = MockHomeDatasource();
    repository = HomeRepository(mockHomeDatasource);
  });

  group('HomeRepository', () {
    group('loadPokemonData', () {
      const mockApiResponse = HomeTestConstants.mockApiPokemonData;

      test('should return Right with list of PokemonModel when datasource returns valid data', () async {
        when(mockHomeDatasource.fetchPokemonData()).thenAnswer((_) async => mockApiResponse);

        final result = await repository.loadPokemonData();

        expect(result, isA<Right<AppGenericFailure, List<PokemonModel>>>());

        result.fold(
          (failure) => fail('Expected Right but got Left: ${failure.message}'),
          (pokemonList) {
            expect(pokemonList, hasLength(3));
            expect(pokemonList.first.name, equals('Bulbasaur'));
            expect(pokemonList.first.id, equals(1));
            expect(pokemonList.first.type, equals(['Grass', 'Poison']));
            expect(pokemonList.last.name, equals('Pikachu'));
            expect(pokemonList.last.id, equals(25));
          },
        );

        verify(mockHomeDatasource.fetchPokemonData()).called(1);
      });

      test('should return Right with empty list when pokemon array is empty', () async {
        const emptyResponse = HomeTestConstants.emptyApiResponse;
        when(mockHomeDatasource.fetchPokemonData()).thenAnswer((_) async => emptyResponse);

        final result = await repository.loadPokemonData();

        expect(result, isA<Right<AppGenericFailure, List<PokemonModel>>>());

        result.fold(
          (failure) => fail('Expected Right but got Left: ${failure.message}'),
          (pokemonList) {
            expect(pokemonList, isEmpty);
          },
        );
      });

      group('API response variations', () {
        test('should handle pokemon with minimal data', () async {
          const minimalResponse = {
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
                'next_evolution': null,
              },
            ],
          };
          when(mockHomeDatasource.fetchPokemonData()).thenAnswer((_) async => minimalResponse);

          final result = await repository.loadPokemonData();

          expect(result, isA<Right<AppGenericFailure, List<PokemonModel>>>());

          result.fold(
            (failure) => fail('Expected Right but got Left: ${failure.message}'),
            (pokemonList) {
              expect(pokemonList, hasLength(1));
              final pokemon = pokemonList.first;
              expect(pokemon.name, equals('TestPokemon'));
              expect(pokemon.candyCount, equals(0)); // Default value for missing field
              expect(pokemon.prevEvolution, isEmpty);
              expect(pokemon.nextEvolution, isEmpty);
            },
          );
        });

        test('should handle pokemon with null evolution arrays', () async {
          when(mockHomeDatasource.fetchPokemonData()).thenAnswer((_) async => HomeTestConstants.nullEvolutionApiResponse);

          final result = await repository.loadPokemonData();

          expect(result, isA<Right<AppGenericFailure, List<PokemonModel>>>());
          result.fold(
            (failure) => fail('Expected Right but got Left: ${failure.message}'),
            (pokemonList) {
              expect(pokemonList, hasLength(1));
              final pokemon = pokemonList.first;
              expect(pokemon.prevEvolution, isEmpty);
              expect(pokemon.nextEvolution, isEmpty);
            },
          );
        });
      });
    });
  });
}
