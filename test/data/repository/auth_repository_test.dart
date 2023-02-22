import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/form/login_form.dart';
import 'package:news_app/data/models/user.dart';
import 'package:news_app/data/remote/auth/auth_api.dart';
import 'package:news_app/data/repository/auth/auth_repository.dart';
import 'package:news_app/data/repository/auth/auth_repository_impl.dart';

import '../../fixtures/fixtures_reader.dart';
import 'auth_repository_test.mocks.dart';

@GenerateMocks([AuthApi])
void main() {
  MockAuthApi mockAuthApi = MockAuthApi();
  late AuthRepository authRepository;

  setUp(() {
    authRepository = AuthRepositoryImpl(authApi: mockAuthApi);
  });

  group('login Api', () {
    final mapResponse = json.decode(fixture('auth_response.json'));
    final BaseResponse<User> response = BaseResponse.fromJson(mapResponse,
        details: User.fromJson(mapResponse['details']));

    final LoginForm loginForm =
        LoginForm(username: 'fahmi', password: '123456789');

    void prepareSuccessfulResponse() {
      when(mockAuthApi.login(loginForm))
          .thenAnswer((realInvocation) async => Future.value(response));
    }

    test('test login api return success', () async {
      prepareSuccessfulResponse();
      final actualResponse = await authRepository.login(loginForm);
      expect(actualResponse.isRight(), true);
    });
  });
}
