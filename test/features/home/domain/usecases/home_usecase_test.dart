import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_c/features/home/domain/models/pokemon_model.dart';
import 'package:tech_c/features/home/domain/usecases/home_usecase.dart';
import 'package:tech_c/global/app_core/domain/models/either.dart';
import 'package:tech_c/global/app_core/failures/app_failure.dart';

import '../../../../mocks/home_mocks.mocks.dart';
import '../../../../mocks/home_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late HomeUsecase usecase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = HomeUsecase(mockHomeRepository);
  });

  setUpAll(() {
    provideDummy<Either<AppGenericFailure, List<PokemonModel>>>(
      Right(<PokemonModel>[]),
    );
  });

  group('HomeUsecase', () {
    group('loadPokemonData', () {
      final mockPokemonList = HomeTestHelpers.createMockPokemonList();

      test('should return Right with pokemon list when repository returns valid data', () async {
        when(mockHomeRepository.loadPokemonData()).thenAnswer((_) async => Right(mockPokemonList));

        final result = await usecase.loadPokemonData();

        expect(result, isA<Right<AppGenericFailure, List<PokemonModel>>>());

        result.fold(
          (failure) => fail('Expected Right but got Left: ${failure.message}'),
          (pokemonList) {
            expect(pokemonList, equals(mockPokemonList));
            expect(pokemonList, hasLength(3));
            expect(pokemonList.first.name, equals('Bulbasaur'));
            expect(pokemonList[1].name, equals('Ivysaur'));
            expect(pokemonList.last.name, equals('Pikachu'));
          },
        );

        verify(mockHomeRepository.loadPokemonData()).called(1);
      });

      test('should return Left with failure when repository returns empty list', () async {
        when(mockHomeRepository.loadPokemonData()).thenAnswer((_) async => Right([]));

        final result = await usecase.loadPokemonData();

        expect(result, isA<Left<AppGenericFailure, List<PokemonModel>>>());

        result.fold(
          (failure) {
            expect(failure.code, equals('home_no_data'));
            expect(failure.message, isNotEmpty);
          },
          (pokemonList) => fail('Expected Left but got Right'),
        );

        verify(mockHomeRepository.loadPokemonData()).called(1);
      });

      test('should return Left with failure when repository returns failure', () async {
        final repositoryFailure = AppGenericFailure(
          message: 'Repository error',
          code: 'repository_error',
        );
        when(mockHomeRepository.loadPokemonData()).thenAnswer((_) async => Left(repositoryFailure));

        final result = await usecase.loadPokemonData();

        expect(result, isA<Left<AppGenericFailure, List<PokemonModel>>>());

        result.fold(
          (failure) {
            expect(failure, equals(repositoryFailure));
            expect(failure.message, equals('Repository error'));
            expect(failure.code, equals('repository_error'));
          },
          (pokemonList) => fail('Expected Left but got Right'),
        );
      });

      group('business logic validation', () {
        test('should accept single pokemon in list', () async {
          final singlePokemonList = [mockPokemonList.first];
          when(mockHomeRepository.loadPokemonData()).thenAnswer((_) async => Right(singlePokemonList));

          final result = await usecase.loadPokemonData();

          expect(result, isA<Right<AppGenericFailure, List<PokemonModel>>>());

          result.fold(
            (failure) => fail('Expected Right but got Left: ${failure.message}'),
            (pokemonList) {
              expect(pokemonList, hasLength(1));
              expect(pokemonList.first.name, equals('Bulbasaur'));
            },
          );
        });

        test('should accept large pokemon list', () async {
          final largePokemonList = List.generate(50, (index) => mockPokemonList[index % mockPokemonList.length]);
          when(mockHomeRepository.loadPokemonData()).thenAnswer((_) async => Right(largePokemonList));

          final result = await usecase.loadPokemonData();

          expect(result, isA<Right<AppGenericFailure, List<PokemonModel>>>());
          result.fold(
            (failure) => fail('Expected Right but got Left: ${failure.message}'),
            (pokemonList) {
              expect(pokemonList, hasLength(50));
              expect(pokemonList.first.name, equals('Bulbasaur'));
            },
          );
        });
      });

      group('error propagation', () {
        test('should propagate errors from repository', () async {
          final networkError = AppGenericFailure(
            message: 'Network connection failed',
            code: 'network_error',
          );
          when(mockHomeRepository.loadPokemonData()).thenAnswer((_) async => Left(networkError));

          final result = await usecase.loadPokemonData();

          expect(result, isA<Left<AppGenericFailure, List<PokemonModel>>>());
          result.fold(
            (failure) {
              expect(failure.message, equals('Network connection failed'));
              expect(failure.code, equals('network_error'));
            },
            (pokemonList) => fail('Expected Left but got Right'),
          );
        });
      });
    });
  });
}
