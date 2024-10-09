import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/categories_repository.dart';

import '../entities/CategoriesEntity.dart';
@injectable
class GetCategoriesUseCase {
  CategoriesRepository categoriesRepository;
  @factoryMethod
  GetCategoriesUseCase({required this.categoriesRepository});
  Future<Either<List<CategoriesEntity>, String>> call(){
    return categoriesRepository.getCategories();
  }
}