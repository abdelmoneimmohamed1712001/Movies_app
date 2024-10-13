import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/SimilarEntity.dart';

abstract class SimilarRepository{
 Future<Either<List<SimilarEntity>,String>> getSimilar(String movieId);
}