import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/popular_data_source.dart';
import 'package:movies_app/domain/entities/PopularEntity.dart';
import 'package:movies_app/domain/repository_contract/popular_repository.dart';

import '../model/popular_response/PopularModel.dart';

@Injectable(as: PopularRepository)
class PopularRepositoryImpl extends PopularRepository {
  PopularDataSource popularDataSource;
  @factoryMethod
  PopularRepositoryImpl({required this.popularDataSource});
  @override
  Future<Either<List<PopularEntity>, String>> getPopular() async {
    var result = await popularDataSource.getPopular();
    return result.fold((popularResponse) {
      List<PopularModel> popularModelList = popularResponse.results ?? [];
      List<PopularEntity> popularEntityList = popularModelList
          .map((popularModel) => popularModel.toPopularEntity())
          .toList();
      return Left(popularEntityList);
    }, (error) {
      return Right(error.toString());
    });
  }
}
