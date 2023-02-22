import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/configuration.dart';
import 'package:news_app/data/remote/config/config_api.dart';
import 'package:news_app/data/remote/config/config_api_impl.dart';

import '../../fixtures/fixtures_reader.dart';
import 'config_api_test.mocks.dart';


@GenerateMocks([Dio])
void main() {
  MockDio mockDio = MockDio();
  late ConfigApi configApi;

  setUp(() {
    configApi = ConfigApiImpl(dio: mockDio);
  });

  group('getListConfig', () {
    final Map<String, dynamic> mapResponse = json.decode(
        fixture('configurations_response.json'));
    final BaseResponse<List<Configuration>> response =
    BaseResponse.fromJson(mapResponse, details: (mapResponse['details'] as List)
        .map((e) => Configuration.fromJson(e)).toList());
    void prepareSuccessfulResponse() {
      when(mockDio.get('v1/configurations')).thenAnswer((
          realInvocation) async =>
          Future.value(
              Response(
                  statusCode: 200,
                  data: mapResponse,
                  requestOptions: RequestOptions(path: 'v1/configurations')
              )
          ));
    }

    test('make sure this endpoint called v1/configurations', () async {
      prepareSuccessfulResponse();
      final expectedResponse = await configApi.getListConfig();
      expect(expectedResponse.details?.length, response.details?.length);
    });

  });
}