import '../../../../global/app_core/app_core.dart';
import '../../domain/models/pokemon_model.dart';
import '../../domain/usecases/home_usecase.dart';

class HomeStore extends ValueStore<List<PokemonModel>> {
  final HomeUsecase _homeUsecase;
  HomeStore(this._homeUsecase) : super(const IdleState());

  Future<void> loadData() async {
    updateState(const LoadingState());
    final result = await _homeUsecase.loadPokemonData();

    result.fold(
      (failure) => updateState(ErrorState(failure)),
      (data) => updateState(SuccessState(data)),
    );
  }
}
