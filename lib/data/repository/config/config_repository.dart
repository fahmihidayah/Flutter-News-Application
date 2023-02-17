import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/configuration.dart';

abstract class ConfigRepository {
  Future<Either<Failure, BaseResponse<List<Configuration>>>> getListConfiguration();
}