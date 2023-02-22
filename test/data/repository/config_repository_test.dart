import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/configuration.dart';
import 'package:news_app/data/remote/config/config_api.dart';
import 'package:news_app/data/repository/config/config_repository.dart';
import 'package:news_app/data/repository/config/config_repository_impl.dart';

import '../../fixtures/fixtures_reader.dart';
import 'config_repository_test.mocks.dart';

@GenerateMocks([ConfigApi])
void main() {
  MockConfigApi mockConfigApi = MockConfigApi();
  late ConfigRepository configRepository;

  setUp(() {
    configRepository = ConfigRepositoryImpl(configApi: mockConfigApi);
  });

  group('getListConfig', () {
    final mapResponse = json.decode(fixture('configurations_response.json'));
    final BaseResponse<List<Configuration>> response = BaseResponse.fromJson(
        mapResponse,
        details: (mapResponse['details'] as List)
            .map((e) => Configuration.fromJson(e))
            .toList());
    void prepareSuccessfulResponse() {
      when(mockConfigApi.getListConfig()).thenAnswer((realInvocation) => Future.value(response));
    }

    test('request list config return success', () async {
      prepareSuccessfulResponse();
      final actualResponse = await configRepository.getListConfiguration();
      expect(actualResponse.isRight(), true);
    });
  });
}
