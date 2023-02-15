import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/user.dart';
import 'package:news_app/data/remote/base_api.dart';

abstract class AuthApi extends BaseApi {
  Future<BaseResponse<User>?> login(String username, String password);
}