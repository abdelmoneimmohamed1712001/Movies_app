import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/CategoriesEntity.dart';

abstract class CategoriesRepository{
 Future<Either<List<CategoriesEntity>,String>> getCategories();
}