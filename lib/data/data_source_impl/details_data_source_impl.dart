import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager/api_manager.dart';
import 'package:movies_app/core/api/end_points/end_points.dart';
import 'package:movies_app/core/constants/constants_manager.dart';
import 'package:movies_app/data/data_source_contract/details_data_source.dart';
import 'package:movies_app/data/model/details_response/DetailsResponse.dart';
@Injectable(as: DetailsDataSource)
class DetailsDataSourceImpl extends DetailsDataSource{
  ApiManager apiDataSource;
  @factoryMethod
  DetailsDataSourceImpl({required this.apiDataSource});
  @override
  Future<Either<DetailsResponse, String>> getDetails(String movieId)async {
    try{
     var response = await apiDataSource.getRequest(endPoint: EndPoints.detailsEndPoint, token: ConstantsManager.token,pathParams: {
        'movie_id':movieId
      });
     DetailsResponse detailsResponse = DetailsResponse.fromJson(response.data);
     return Left(detailsResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}