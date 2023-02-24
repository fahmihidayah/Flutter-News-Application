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
import '../../fixtures/model/configurations_fixtures.dart';
import 'config_api_test.mocks.dart';


@GenerateMocks([Dio])
void main() {
  MockDio mockDio = MockDio();
  late ConfigApi configApi;

  setUp(() {
    configApi = ConfigApiImpl(dio: mockDio);
  });

  group('getListConfig', () {
    final Map<String, dynamic> mapResponse = getListConfigurationMap();
    final BaseResponse<List<Configuration>> response = getBaseResponseListConfiguration();

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

    test('test request to v1/configurations result success', () async {
      prepareSuccessfulResponse();
      final expectedResponse = await configApi.getListConfig();
      expect(expectedResponse.details?.length, response.details?.length);
    });

  });
}