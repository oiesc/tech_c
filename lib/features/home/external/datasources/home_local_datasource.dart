import 'dart:convert';

import '../../../../global/services/app_storage/app_native_storage.dart';

class HomeLocalDatasource {
  Future<Map<String, dynamic>?> getPokemonCache() async {
    final cached = await AppNativeStorage.getFromCache('pokemon_data');
    if (cached == null || cached.isEmpty) return null;
    return jsonDecode(cached);
  }

  Future<void> savePokemonCache(Map<String, dynamic> data) async {
    await AppNativeStorage.saveOnCache(
      key: 'pokemon_data',
      value: jsonEncode(data),
    );
  }
}
