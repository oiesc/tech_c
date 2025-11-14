import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_c/features/home/domain/models/home_data_model.dart';
import 'package:tech_c/features/home/domain/models/pokemon_model.dart';
import 'package:tech_c/features/home/presentation/stores/home_store.dart';
import 'package:tech_c/global/app_core/domain/models/either.dart';
import 'package:tech_c/global/app_core/failures/app_failure.dart';
import 'package:tech_c/global/app_core/store/app_state.dart';

import '../../../../mocks/home_mocks.mocks.dart';
import '../../../../mocks/home_test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late HomeStore store;
  late MockHomeUsecase mockHomeUsecase;

  setUp(() {
    mockHomeUsecase = MockHomeUsecase();
    store = HomeStore(mockHomeUsecase);
  });

  setUpAll(() {
    provideDummy<Either<AppGenericFailure, List<PokemonModel>>>(
      Right(<PokemonModel>[]),
    );
  });

  tearDown(() {
    store.dispose();
  });

  group('HomeStore', () {
    group('initial state', () {
      test('should start with IdleState', () {
        expect(store.state, isA<IdleState>());
      });

      test('should have correct initial state value', () {
        expect(store.state, equals(const IdleState<HomeDataModel>()));
      });
    });

    group('loadData', () {
      final mockPokemonList = HomeTestHelpers.createMockPokemonList();

      test('should update state to LoadingState then SuccessState when usecase returns success', () async {
        when(mockHomeUsecase.loadPokemonData()).thenAnswer((_) async => Right(mockPokemonList));

        final List<AppState<HomeDataModel>> stateChanges = [];
        store.addListener((state) {
          stateChanges.add(state);
        });

        await store.loadData();

        await Future.delayed(const Duration(seconds: 2));

        expect(stateChanges, hasLength(2)); // LoadingState -> SuccessState
        expect(stateChanges.first, isA<LoadingState<HomeDataModel>>());
        expect(stateChanges.last, isA<SuccessState<HomeDataModel>>());

        final successState = stateChanges.last as SuccessState<HomeDataModel>;
        expect(successState.data.allPokemons, hasLength(3));
        expect(successState.data.filteredPokemons, hasLength(3));
        expect(successState.data.allPokemons, equals(mockPokemonList));
        expect(successState.data.filteredPokemons, equals(mockPokemonList));

        verify(mockHomeUsecase.loadPokemonData()).called(1);
      });

      test('should update state to LoadingState then ErrorState when usecase returns failure', () async {
        final failure = AppGenericFailure(message: 'Network error', code: 'network_error');
        when(mockHomeUsecase.loadPokemonData()).thenAnswer((_) async => Left(failure));

        final List<AppState<HomeDataModel>> stateChanges = [];
        store.addListener((state) {
          stateChanges.add(state);
        });

        await store.loadData();

        await Future.delayed(const Duration(seconds: 2));

        expect(stateChanges, hasLength(2)); // LoadingState -> ErrorState
        expect(stateChanges.first, isA<LoadingState<HomeDataModel>>());
        expect(stateChanges.last, isA<ErrorState<HomeDataModel>>());

        final errorState = stateChanges.last as ErrorState<HomeDataModel>;
        expect(errorState.error, equals(failure));
        expect(errorState.error.message, equals('Network error'));
        expect(errorState.error.code, equals('network_error'));

        verify(mockHomeUsecase.loadPokemonData()).called(1);
      });
    });

    group('search', () {
      setUp(() async {
        when(mockHomeUsecase.loadPokemonData()).thenAnswer((_) async => Right(HomeTestHelpers.createMockPokemonList()));
        await store.loadData();
        await Future.delayed(const Duration(seconds: 2));
      });

      test('should filter pokemon by name (case insensitive)', () async {
        store.search('bulb');

        await Future.delayed(const Duration(seconds: 1));

        expect(store.state, isA<SuccessState<HomeDataModel>>());
        final successState = store.state as SuccessState<HomeDataModel>;
        expect(successState.data.filteredPokemons, hasLength(1));
        expect(successState.data.filteredPokemons.first.name, equals('Bulbasaur'));
        expect(successState.data.allPokemons, hasLength(3)); // Original data should remain unchanged
      });

      test('should filter pokemon by partial name match', () async {
        store.search('ika'); // Should match Pikachu

        await Future.delayed(const Duration(seconds: 1));

        final successState = store.state as SuccessState<HomeDataModel>;
        expect(successState.data.filteredPokemons, hasLength(1));
        expect(successState.data.filteredPokemons.first.name, equals('Pikachu'));
      });

      test('should return empty list when no pokemon matches search query', () async {
        store.search('Charizard'); // Not in mock data

        await Future.delayed(const Duration(seconds: 1));

        final successState = store.state as SuccessState<HomeDataModel>;
        expect(successState.data.filteredPokemons, isEmpty);
        expect(successState.data.allPokemons, hasLength(3)); // Original data should remain unchanged
      });

      test('should return all pokemon when search query is empty', () async {
        store.search('');

        await Future.delayed(const Duration(seconds: 1));

        final successState = store.state as SuccessState<HomeDataModel>;
        expect(successState.data.filteredPokemons, hasLength(3));
        expect(successState.data.allPokemons, hasLength(3));
      });
    });
  });
}
