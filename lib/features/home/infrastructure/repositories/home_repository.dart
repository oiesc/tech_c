import 'dart:io';

import '../../../../global/app_core/domain/models/either.dart';
import '../../../../global/app_core/failures/app_failure.dart';
import '../../../../global/utils/app_utils.dart';
import '../../domain/models/pokemon_model.dart';
import '../../external/datasources/home_local_datasource.dart';
import '../../external/datasources/home_remote_datasource.dart';
import '../../external/settings/home_http_errors.dart';
import '../settings/home_repository_errors.dart';

class HomeRepository {
  final HomeRemoteDatasource _remote;
  final HomeLocalDatasource _local;

  HomeRepository(this._remote, this._local);

  Future<Either<AppGenericFailure, List<PokemonModel>>> loadPokemonData() async {
    try {
      Map<String, dynamic>? response;
      // only implemented caching for Android for now
      final cachedData = Platform.isAndroid ? await _local.getPokemonCache() : null;

      if (cachedData == null) {
        AppLogger.info('No cached data found. Fetching from datasource.');
        response = await _remote.fetchPokemonData();
        _local.savePokemonCache(response);
      } else {
        AppLogger.info('Cached data found. Using cached data.');
        response = cachedData;
      }
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
