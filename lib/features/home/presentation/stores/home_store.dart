import '../../../../global/app_core/app_core.dart';
import '../../../../global/utils/debouncer.dart';
import '../../domain/models/home_data_model.dart';
import '../../domain/models/pokemon_model.dart';
import '../../domain/usecases/home_usecase.dart';

class HomeStore extends ValueStore<HomeDataModel> {
  final HomeUsecase _homeUsecase;
  HomeStore(this._homeUsecase) : super(const IdleState());

  List<PokemonModel> _allPokemons = [];
  final _debouncer = Debouncer();

  Future<void> loadData() async {
    updateState(const LoadingState());
    await Future.delayed(const Duration(seconds: 3)); // Simulate delay
    final result = await _homeUsecase.loadPokemonData();

    result.fold((failure) => updateState(ErrorState(failure)), (data) {
      _allPokemons = data;
      updateState(SuccessState(HomeDataModel(allPokemons: data, filteredPokemons: data)));
    });
  }

  void search(String query) {
    updateState(const LoadingState());
    _debouncer(
      () {
        final q = query.toLowerCase();
        final filtered = _allPokemons.where((p) {
          return p.name.toLowerCase().contains(q);
        }).toList();

        updateState(SuccessState(HomeDataModel(allPokemons: _allPokemons, filteredPokemons: filtered)));
      },
    );
  }
}
