import 'package:mockito/annotations.dart';
import 'package:techc/features/home/domain/usecases/home_usecase.dart';
import 'package:techc/features/home/external/datasources/home_local_datasource.dart';
import 'package:techc/features/home/external/datasources/home_remote_datasource.dart';
import 'package:techc/features/home/infrastructure/repositories/home_repository.dart';
import 'package:techc/global/network/app_http.dart';

@GenerateMocks([
  AppHttp,
  HomeRemoteDatasource,
  HomeLocalDatasource,
  HomeRepository,
  HomeUsecase,
])
void main() {
  // This file is used to generate mocks for testing
  // Run: dart run build_runner build --delete-conflicting-outputs
}
