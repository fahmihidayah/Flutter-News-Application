import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/form/login_form.dart';
import 'package:news_app/data/models/user.dart';
import 'package:news_app/data/remote/auth/auth_api.dart';
import 'package:news_app/data/repository/auth/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {

  final AuthApi authApi;


  AuthRepositoryImpl({required this.authApi});

  @override
  Future<Either<Failure, BaseResponse<User>>> login(LoginForm loginForm) async {
    try {
      final response = await authApi.login(loginForm);
      if(response != null) {
        return Right(response);
      }
      return Left(ServerFailure());
    }
    catch (e) {
      return Left(ServerFailure());
    }
  }

}