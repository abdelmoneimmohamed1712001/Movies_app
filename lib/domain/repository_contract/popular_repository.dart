import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/PopularEntity.dart';

abstract class PopularRepository{
  Future<Either<List<PopularEntity>,String>>getPopular();
}