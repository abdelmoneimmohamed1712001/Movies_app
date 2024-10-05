import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager/api_manager.dart';
import 'package:movies_app/core/api/end_points/end_points.dart';
import 'package:movies_app/core/constants/constants_manager.dart';
import 'package:movies_app/data/data_source_contract/popular_data_source.dart';
import 'package:movies_app/data/model/popular_response/PopularResponse.dart';
@Injectable(as: PopularDataSource)
class PopularDataSourceImpl extends PopularDataSource{
ApiManager apiDatasource ;
@factoryMethod
PopularDataSourceImpl({required this.apiDatasource});
  @override
  Future<Either<PopularResponse, String>> getPopular() async{
    try{
     var response =await apiDatasource.getRequest(endPoint: EndPoints.popularEndPoint, token: ConstantsManager.token);
     PopularResponse popularResponse =PopularResponse.fromJson(response.data);
     return Left(popularResponse);
    }catch(error){
      return Right(error.toString());
    }

  }

}