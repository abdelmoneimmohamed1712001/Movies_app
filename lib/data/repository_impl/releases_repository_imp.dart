import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/releases_data_source.dart';
import 'package:movies_app/data/model/releases_response/ReleasesModel.dart';
import 'package:movies_app/domain/entities/ReleasesEntity.dart';
import 'package:movies_app/domain/repository_contract/releases_repository.dart';
@Injectable(as: ReleasesRepository)
class ReleasesRepositoryImpl extends ReleasesRepository {
  ReleasesDataSource releasesDataSource;
  @factoryMethod
  ReleasesRepositoryImpl({required this.releasesDataSource});
  @override
  Future<Either<List<ReleasesEntity>, String>> getReleases() async {
    var result = await releasesDataSource.getReleases();
   return result.fold((releasesResponse) {
      List<ReleasesModel> releasesModelList = releasesResponse.results ?? [];
      List<ReleasesEntity> releasesEntityList = releasesModelList
          .map((releasesModel) => releasesModel.toReleasesEntity())
          .toList();
      return Left(releasesEntityList);
    }, (error) {
      return Right(error);
    });
  }
}
