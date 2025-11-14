import '../../../../global/app_core/app_core.dart';
import '../../../../global/services/analytics_service.dart';
import '../../../../global/utils/debouncer.dart';
import '../../domain/models/home_data_model.dart';
import '../../domain/models/pokemon_model.dart';
import '../../domain/usecases/home_usecase.dart';

class HomeStore extends ValueStore<HomeDataModel> {
  final HomeUsecase _homeUsecase;
  HomeStore(this._homeUsecase) : super(const IdleState());

  final List<PokemonModel> _allPokemons = [];
  final _debouncer = Debouncer();
  List<String> get allTypes {
    return _allPokemons.expand((p) => p.type).toSet().toList()..sort();
  }

  Future<void> loadData() async {
    updateState(const LoadingState());
    _allPokemons.clear();
    await Future.delayed(const Duration(seconds: 3)); // Simulate delay
    final result = await _homeUsecase.loadPokemonData();

    result.fold((failure) => updateState(ErrorState(failure)), (data) {
      _allPokemons.addAll(data);
      updateState(
        SuccessState(
          HomeDataModel(
            allPokemons: data,
            filteredPokemons: data,
            hasFilter: false,
          ),
        ),
      );
    });
  }

  void search(String query) {
    updateState(const LoadingState());
    _debouncer(
      () {
        final q = query.toLowerCase();
        AnalyticsService.logSearch(q);
        final filtered = _allPokemons.where((p) {
          return p.name.toLowerCase().contains(q);
        }).toList();

        updateState(
          SuccessState(
            HomeDataModel(
              allPokemons: _allPokemons,
              filteredPokemons: filtered,
              hasFilter: true,
            ),
          ),
        );
      },
    );
  }

  void filterByType(String type) async {
    updateState(const LoadingState());

    await Future.delayed(const Duration(milliseconds: 500)); // Simulate delay

    if (type.isEmpty) {
      updateState(
        SuccessState(
          HomeDataModel(
            allPokemons: _allPokemons,
            filteredPokemons: _allPokemons,
            hasFilter: false,
          ),
        ),
      );
    } else {
      final filtered = _allPokemons.where((p) => p.type.contains(type)).toList();
      updateState(
        SuccessState(
          HomeDataModel(
            allPokemons: _allPokemons,
            filteredPokemons: filtered,
            hasFilter: true,
          ),
        ),
      );
    }
  }
}
