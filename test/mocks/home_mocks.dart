import 'package:mockito/annotations.dart';

import '../../lib/features/home/domain/usecases/home_usecase.dart';
import '../../lib/features/home/external/datasources/home_datasource.dart';
import '../../lib/features/home/infrastructure/repositories/home_repository.dart';
import '../../lib/global/network/app_http.dart';

@GenerateMocks([
  AppHttp,
  HomeDatasource,
  HomeRepository,
  HomeUsecase,
])
void main() {
  // This file is used to generate mocks for testing
  // Run: dart run build_runner build --delete-conflicting-outputs
}