import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/data/models/base_response.dart';
import 'package:news_app/data/models/configuration.dart';
import 'package:news_app/data/repository/config/config_repository.dart';

class LoadConfiguration extends UseCase<BaseResponse<List<Configuration>>, NoParams> {
  final ConfigRepository configRepository;


  LoadConfiguration({required this.configRepository});

  @override
  Future<Either<Failure, BaseResponse<List<Configuration>>>> call(NoParams params) async {
    return await configRepository.getListConfiguration();
  }

}