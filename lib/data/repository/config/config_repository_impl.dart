import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/configuration.dart';
import 'package:news_app/data/remote/config/config_api.dart';
import 'package:news_app/data/repository/config/config_repository.dart';

class ConfigRepositoryImpl extends ConfigRepository {
  final ConfigApi configApi;

  ConfigRepositoryImpl({required this.configApi});

  @override
  Future<Either<Failure, BaseResponse<List<Configuration>>>> getListConfiguration() async {
    try {
      final response = await configApi.getListConfig();
      return Right(response);
    }
    catch(ex) {
      return Left(ServerFailure());
    }
  }

}