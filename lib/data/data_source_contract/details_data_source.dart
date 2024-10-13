import 'package:dartz/dartz.dart';
import 'package:movies_app/data/model/details_response/DetailsResponse.dart';

abstract class DetailsDataSource{
 Future<Either<DetailsResponse,String>> getDetails(String movieId);
}