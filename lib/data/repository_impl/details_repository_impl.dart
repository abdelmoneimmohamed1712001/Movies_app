import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/details_data_source.dart';
import 'package:movies_app/data/model/details_response/DetailsModel.dart';

import 'package:movies_app/domain/entities/DetailsEntity.dart';

import '../../domain/repository_contract/details_repository.dart';
@Injectable(as: DetailsRepository)
class DetailsRepositoryImpl extends DetailsRepository{
  DetailsDataSource detailsDataSource;
  @factoryMethod
  DetailsRepositoryImpl({required this.detailsDataSource});
  @override
  Future<Either<DetailsEntity, String>> getMovies(String movieId) async{
    var result = await detailsDataSource.getDetails(movieId);
    return result.fold((detailsResponse){
    var detailsModel = detailsResponse.results;
    if (detailsModel != null) {
      var detailsEntity = detailsModel.toDetailsEntity();
      return Left(detailsEntity);
    } else {
      return Right("Movie details not found.");
    }
        }, (error) {
      return Right(error);
    });
  }

}