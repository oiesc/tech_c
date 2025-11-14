import '../../../../global/app_core/domain/models/either.dart';
import '../../../../global/app_core/failures/app_failure.dart';
import '../../../../global/utils/app_utils.dart';
import '../../domain/models/pokemon_model.dart';
import '../../external/datasources/home_datasource.dart';
import '../../external/settings/home_http_errors.dart';
import '../settings/home_repository_errors.dart';

class HomeRepository {
  final HomeDatasource _homeDatasource;

  HomeRepository(this._homeDatasource);

  Future<Either<AppGenericFailure, List<PokemonModel>>> loadPokemonData() async {
    try {
      final response = await _homeDatasource.fetchPokemonData();
      final pokemonList = (response['pokemon'] as List)
          .map((pokemonJson) => PokemonModel.fromJson(pokemonJson))
          .toList();
      return Right(pokemonList);
    } on FormatException catch (e) {
      final error = HomeRepositoryErrors.formatError;
      AppLogger.error(error.message, e);
      return Left(AppGenericFailure(message: error.message, code: error.code, error: e));
    } on HomeHttpErrors catch (e) {
      AppLogger.error(e.message, e);
      return Left(AppGenericFailure(message: e.message, code: e.code, error: e));
    } catch (e) {
      final error = HomeRepositoryErrors.unexpectedError;
      AppLogger.error(error.message, e);
      return Left(AppGenericFailure(message: error.message, code: error.code, error: e));
    }
  }
}
