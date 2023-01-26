import 'package:news_app/core/data/models/base_response.dart';
import 'package:news_app/core/data/models/user.dart';
import 'package:news_app/core/data/remote/auth_api.dart';

class AuthRepository {
  AuthApi authApi;

  AuthRepository({required this.authApi});

  Future<BaseResponse<User>?> login(String username, String password) async {
    final BaseResponse<User>? response = await authApi.login(username, password);
    return response;
  }
}