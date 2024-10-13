import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/similar_data_source.dart';
import 'package:movies_app/data/model/similar_response/SimilarModel.dart';
import 'package:movies_app/domain/entities/SimilarEntity.dart';
import '../../domain/repository_contract/similar_repository.dart';
@Injectable(as: SimilarRepository)
class SimilarRepositoryImpl extends SimilarRepository{
  SimilarDataSource similarDataSource;
  @factoryMethod
  SimilarRepositoryImpl({required this.similarDataSource});
  @override
  Future<Either<List<SimilarEntity>, String>> getSimilar(String movieId) async{
    var result = await similarDataSource.getSimilar(movieId);
    return result.fold((similarResponse){
      List<SimilarModel> similarModelList = similarResponse.results??[];
      List<SimilarEntity> similarEntityList = similarModelList.map((e) => e.toSimilarEntity()).toList();
      return Left(similarEntityList);
    }, (error) {
      return Right(error);
    });

  }

}