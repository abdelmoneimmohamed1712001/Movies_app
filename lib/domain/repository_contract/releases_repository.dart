import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/ReleasesEntity.dart';

abstract class ReleasesRepository{
 Future<Either<List<ReleasesEntity>,String>> getReleases();
}