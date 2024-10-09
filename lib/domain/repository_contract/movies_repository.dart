import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';

abstract class MoviesRepository{
 Future<Either<List<MoviesEntity>,String>> getMovies(String categoryId);
}