import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/DetailsEntity.dart';

abstract class DetailsRepository{
 Future<Either<DetailsEntity,String>> getMovies(String movieId);
}