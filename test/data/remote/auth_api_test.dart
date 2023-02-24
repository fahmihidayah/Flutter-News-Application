import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/form/login_form.dart';
import 'package:news_app/data/models/user.dart';
import 'package:news_app/data/remote/auth/auth_api.dart';
import 'package:news_app/data/remote/auth/auth_api_impl.dart';

import '../../fixtures/fixtures_reader.dart';
import '../../fixtures/model/auth_fixtures.dart';
import 'auth_api_test.mocks.dart';


@GenerateMocks([Dio])
void main() {
  final MockDio mockDio = MockDio();
  late AuthApi authApi;

  setUp(() {
    authApi = AuthApiImpl(dio: mockDio);
  });

  group('login', () {
    final Map<String, dynamic> mapResponse = getUserMap();
    final BaseResponse<User> expectedResponse = getBaseResponseUser();
    final LoginForm form = LoginForm(username: "fahmi", password: "123456789");
    void prepareSuccessfulRequest() {
      when(mockDio.post('v1/login', data: form.toJson())).thenAnswer((_) async => Future.value(Response(
        statusCode: 200,
        data: mapResponse,
        requestOptions: RequestOptions(path: 'v1/login')
      )));
    }

    test('test request to v1/login response success', () async {
      prepareSuccessfulRequest();
      final response = await authApi.login(form);
      expect(response.details?.username, expectedResponse.details?.username);
    });
  });
}
