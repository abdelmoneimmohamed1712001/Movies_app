import 'package:dartz/dartz.dart';
import 'package:movies_app/data/model/releases_response/ReleasesResponse.dart';

abstract class ReleasesDataSource{
  Future<Either<ReleasesResponse,String>>getReleases();
}