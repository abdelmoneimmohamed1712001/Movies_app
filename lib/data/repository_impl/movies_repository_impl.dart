import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/movies_data_source.dart';
import 'package:movies_app/data/model/movies_response/MoviesModel.dart';

import 'package:movies_app/domain/entities/MoviesEntity.dart';

import '../../domain/repository_contract/movies_repository.dart';
@Injectable(as: MoviesRepository)
class MoviesRepositoryImpl extends MoviesRepository {
  MoviesDataSource moviesDataSource;
  @factoryMethod
  MoviesRepositoryImpl({required this.moviesDataSource});
  @override
  Future<Either<List<MoviesEntity>, String>> getMovies(String categoryId) async {
    var result = await moviesDataSource.getMovies(categoryId);
    return result.fold((moviesResponse) {
      List<MoviesModel> moviesModelList = moviesResponse.results ?? [];
      List<MoviesEntity> moviesEntityList = moviesModelList
          .map((moviesModel) => moviesModel.toMoviesEntity())
          .toList();
      return Left(moviesEntityList);
    }, (error) {
      return Right(error);
    });
  }
}
