import '../../../../global/app_core/domain/models/either.dart';
import '../../../../global/app_core/failures/app_failure.dart';
import '../../../../global/utils/app_failure_message.dart';
import '../../infrastructure/repositories/home_repository.dart';
import '../models/pokemon_model.dart';

class HomeUsecase {
  final HomeRepository homeRepository;

  HomeUsecase(this.homeRepository);

  Future<Either<AppGenericFailure, List<PokemonModel>>> loadPokemonData() async {
    final data = await homeRepository.loadPokemonData();

    const errorCode = 'home_no_data';

    return data.fold(
      (failure) => Left(failure),
      (pokemonList) {
        if (pokemonList.isEmpty) {
          return Left(
            AppGenericFailure(
              message: AppFailureMessage.get(errorCode),
              code: errorCode,
            ),
          );
        }
        return Right(pokemonList);
      },
    );
  }
}
