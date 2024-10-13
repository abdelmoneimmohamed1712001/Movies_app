import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager/api_manager.dart';
import 'package:movies_app/core/api/end_points/end_points.dart';
import 'package:movies_app/core/constants/constants_manager.dart';
import 'package:movies_app/data/model/similar_response/SimilarResponse.dart';
import '../data_source_contract/similar_data_source.dart';
@Injectable(as: SimilarDataSource)
class SimilarDataSourceImpl extends SimilarDataSource{
  ApiManager apiDataSource;
  @factoryMethod
  SimilarDataSourceImpl({required this.apiDataSource});
  @override
  Future<Either<SimilarResponse, String>> getSimilar(String movieId)async {
    try{
      var response = await apiDataSource.getRequest(endPoint: EndPoints.similarEndPoint, token: ConstantsManager.token,pathParams: {
        'movie_id':movieId
      });
      SimilarResponse similarResponse = SimilarResponse.fromJson(response.data);
      return Left(similarResponse);

    }catch(error){
      return Right(error.toString());
    }
  }

}