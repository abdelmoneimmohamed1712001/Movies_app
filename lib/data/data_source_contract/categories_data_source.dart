import 'package:dartz/dartz.dart';
import 'package:movies_app/data/model/categories_response/CategoriesResponse.dart';

abstract class CategoriesDataSource {
  Future<Either<CategoriesResponse,String>>getCategories();
}