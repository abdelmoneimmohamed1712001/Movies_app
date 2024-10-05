import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager/api_manager.dart';
import 'package:movies_app/core/api/end_points/end_points.dart';
import 'package:movies_app/core/constants/constants_manager.dart';
import 'package:movies_app/data/data_source_contract/releases_data_source.dart';
import 'package:movies_app/data/model/releases_response/ReleasesResponse.dart';
@Injectable(as: ReleasesDataSource)
class ReleasesDataSourceImpl extends ReleasesDataSource{
  ApiManager apiDataSource;
  @factoryMethod
  ReleasesDataSourceImpl({required this.apiDataSource});
  @override
  Future<Either<ReleasesResponse, String>> getReleases() async{
    try{
      var response = await apiDataSource.getRequest(endPoint: EndPoints.releasesEndPoint, token: ConstantsManager.token);
      ReleasesResponse releasesResponse = ReleasesResponse.fromJson(response.data);
      return Left(releasesResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}