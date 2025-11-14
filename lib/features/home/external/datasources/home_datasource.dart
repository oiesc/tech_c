import 'package:dio/dio.dart';

import '../../../../global/network/app_http.dart';
import '../settings/home_endpoints.dart';
import '../settings/home_http_errors.dart';

class HomeDatasource {
  final AppHttp _appHttp;

  HomeDatasource(this._appHttp);

  Future<Map<String, dynamic>> fetchPokemonData() async {
    try {
      final response = await _appHttp.get(HomeEndpoints.pokemonData);

      if (response.data == null) {
        throw HomeHttpErrors.nullData;
      }

      if (response.data is! Map<String, dynamic>) {
        throw HomeHttpErrors.invalidData;
      }

      return response.data;
    } on DioException catch (e) {
      final error = HomeHttpErrors.fromDio(e);
      throw error;
    } on HomeHttpErrors catch (_) {
      rethrow;
    } catch (e) {
      throw HomeHttpErrors.unexpectedError;
    }
  }
}
