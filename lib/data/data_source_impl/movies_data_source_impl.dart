import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager/api_manager.dart';
import 'package:movies_app/core/api/end_points/end_points.dart';
import 'package:movies_app/core/constants/constants_manager.dart';
import 'package:movies_app/data/data_source_contract/movies_data_source.dart';
import 'package:movies_app/data/model/movies_response/MoviesResponse.dart';
@Injectable(as: MoviesDataSource)
class MoviesDataSourceImpl extends MoviesDataSource{
  ApiManager apiDataSource;
  @factoryMethod
  MoviesDataSourceImpl({required this.apiDataSource});
  @override
  Future<Either<MoviesResponse, String>> getMovies(String categoryId)async {
    try{
    var response = await apiDataSource.getRequest(endPoint: EndPoints.moviesEndPoint, token: ConstantsManager.token,queryParameters:
    {
      'with_genres': categoryId
    });
    MoviesResponse moviesResponse = MoviesResponse.fromJson(response.data);
    return Left(moviesResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}