import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/form/login_form.dart';
import 'package:news_app/data/models/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, BaseResponse<User>>> login(LoginForm loginForm);
}