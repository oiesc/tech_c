import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:techc/features/home/external/datasources/home_remote_datasource.dart';
import 'package:techc/features/home/external/settings/home_endpoints.dart';
import 'package:techc/features/home/external/settings/home_http_errors.dart';

import '../../../../mocks/home_mocks.mocks.dart';
import '../../../../mocks/home_test_constants.dart';

void main() {
  late HomeRemoteDatasource datasource;
  late MockAppHttp mockAppHttp;

  setUp(() {
    mockAppHttp = MockAppHttp();
    datasource = HomeRemoteDatasource(mockAppHttp);
  });

  group('HomeDatasource', () {
    Response<String> createResponse({String? data, int statusCode = 200}) {
      return Response<String>(
        data: data,
        statusCode: statusCode,
        requestOptions: RequestOptions(path: HomeEndpoints.pokemonData),
      );
    }

    group('fetchPokemonData', () {
      test('should return pokemon data when the call is successful', () async {
        final response = createResponse(data: jsonEncode(HomeTestConstants.mockApiPokemonData));

        when(
          mockAppHttp.get(HomeEndpoints.pokemonData, options: anyNamed('options')),
        ).thenAnswer((_) async => response);

        final result = await datasource.fetchPokemonData();

        expect(result, equals(HomeTestConstants.mockApiPokemonData));
        verify(mockAppHttp.get(HomeEndpoints.pokemonData, options: anyNamed('options'))).called(1);
      });

      test('should throw HomeHttpErrors.nullData when response data is null', () async {
        when(
          mockAppHttp.get(HomeEndpoints.pokemonData, options: anyNamed('options')),
        ).thenAnswer((_) async => createResponse());

        expect(() async => await datasource.fetchPokemonData(), throwsA(equals(HomeHttpErrors.nullData)));
      });

      test('should throw HomeHttpErrors.invalidData when response data is not a Map', () async {
        when(
          mockAppHttp.get(HomeEndpoints.pokemonData, options: anyNamed('options')),
        ).thenAnswer((_) async => createResponse(data: jsonEncode(['invalid', 'data'])));

        expect(() async => await datasource.fetchPokemonData(), throwsA(equals(HomeHttpErrors.invalidData)));
      });

      test('should throw HomeHttpErrors.notFound when DioException has 404 status code', () async {
        final dioException = DioException(
          requestOptions: RequestOptions(path: HomeEndpoints.pokemonData),
          response: Response(
            statusCode: 404,
            requestOptions: RequestOptions(path: HomeEndpoints.pokemonData),
          ),
          type: DioExceptionType.badResponse,
        );

        when(
          mockAppHttp.get(
            HomeEndpoints.pokemonData,
            options: anyNamed('options'),
          ),
        ).thenThrow(dioException);

        expect(
          () async => await datasource.fetchPokemonData(),
          throwsA(equals(HomeHttpErrors.notFound)),
        );
      });

      test('should throw HomeHttpErrors.serverError when DioException has 500 status code', () async {
        final dioException = DioException(
          requestOptions: RequestOptions(path: HomeEndpoints.pokemonData),
          response: Response(
            statusCode: 500,
            requestOptions: RequestOptions(path: HomeEndpoints.pokemonData),
          ),
          type: DioExceptionType.badResponse,
        );

        when(
          mockAppHttp.get(
            HomeEndpoints.pokemonData,
            options: anyNamed('options'),
          ),
        ).thenThrow(dioException);

        expect(
          () async => await datasource.fetchPokemonData(),
          throwsA(equals(HomeHttpErrors.serverError)),
        );
      });

      test('should throw HomeHttpErrors.failedRequest when DioException is timeout', () async {
        final dioException = DioException(
          requestOptions: RequestOptions(path: HomeEndpoints.pokemonData),
          type: DioExceptionType.connectionTimeout,
        );

        when(
          mockAppHttp.get(
            HomeEndpoints.pokemonData,
            options: anyNamed('options'),
          ),
        ).thenThrow(dioException);

        expect(
          () async => await datasource.fetchPokemonData(),
          throwsA(equals(HomeHttpErrors.failedRequest)),
        );
      });

      test('should throw HomeHttpErrors.unexpectedError when unknown DioException occurs', () async {
        final dioException = DioException(
          requestOptions: RequestOptions(path: HomeEndpoints.pokemonData),
        );

        when(
          mockAppHttp.get(
            HomeEndpoints.pokemonData,
            options: anyNamed('options'),
          ),
        ).thenThrow(dioException);

        expect(
          () async => await datasource.fetchPokemonData(),
          throwsA(equals(HomeHttpErrors.unexpectedError)),
        );
      });

      test('should rethrow HomeHttpErrors when it is already a HomeHttpErrors', () async {
        when(
          mockAppHttp.get(
            HomeEndpoints.pokemonData,
            options: anyNamed('options'),
          ),
        ).thenThrow(HomeHttpErrors.invalidData);

        expect(
          () async => await datasource.fetchPokemonData(),
          throwsA(equals(HomeHttpErrors.invalidData)),
        );
      });

      test('should throw HomeHttpErrors.unexpectedError when unexpected error occurs', () async {
        when(
          mockAppHttp.get(
            HomeEndpoints.pokemonData,
            options: anyNamed('options'),
          ),
        ).thenThrow(Exception('Unexpected error'));

        expect(
          () async => await datasource.fetchPokemonData(),
          throwsA(equals(HomeHttpErrors.unexpectedError)),
        );
      });
    });
  });
}
