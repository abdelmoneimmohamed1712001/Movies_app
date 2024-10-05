import 'package:dartz/dartz.dart';
import 'package:movies_app/data/model/popular_response/PopularResponse.dart';

abstract class PopularDataSource {
Future<Either<PopularResponse,String>>getPopular();
}