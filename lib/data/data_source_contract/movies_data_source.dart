import 'package:dartz/dartz.dart';
import 'package:movies_app/data/model/movies_response/MoviesResponse.dart';

abstract class MoviesDataSource{
 Future<Either<MoviesResponse,String>> getMovies(String categoryId);
}