import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/form/login_form.dart';
import 'package:news_app/data/models/user.dart';
import 'package:news_app/data/remote/base_api.dart';

abstract class AuthApi extends BaseApi {
  Future<BaseResponse<User>> login(LoginForm loginForm);
}