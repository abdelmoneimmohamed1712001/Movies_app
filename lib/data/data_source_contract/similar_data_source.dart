import 'package:dartz/dartz.dart';
import 'package:movies_app/data/model/similar_response/SimilarResponse.dart';

abstract class SimilarDataSource{
 Future<Either<SimilarResponse,String>> getSimilar(String movieId);
}