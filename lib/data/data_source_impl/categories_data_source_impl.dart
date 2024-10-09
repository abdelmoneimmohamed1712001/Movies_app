import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager/api_manager.dart';
import 'package:movies_app/core/api/end_points/end_points.dart';
import 'package:movies_app/core/constants/constants_manager.dart';

import 'package:movies_app/data/model/categories_response/CategoriesResponse.dart';
import 'package:movies_app/domain/entities/CategoriesEntity.dart';

import '../data_source_contract/categories_data_source.dart';
@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl extends CategoriesDataSource{
  ApiManager apiDataSource;
  @factoryMethod
  CategoriesDataSourceImpl({required this.apiDataSource});
  @override
  Future<Either<CategoriesResponse, String>> getCategories()async {
    try{
    var response = await apiDataSource.getRequest(endPoint: EndPoints.categoriesEndPoint, token: ConstantsManager.token);
    CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(response.data);
    return Left(categoriesResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}