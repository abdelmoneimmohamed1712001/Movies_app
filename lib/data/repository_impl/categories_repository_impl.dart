import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/categories_data_source.dart';
import 'package:movies_app/data/model/categories_response/CategoriesModel.dart';

import 'package:movies_app/domain/entities/CategoriesEntity.dart';

import '../../domain/repository_contract/categories_repository.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl extends CategoriesRepository {
  CategoriesDataSource categoriesDataSource;
  @factoryMethod
  CategoriesRepositoryImpl({required this.categoriesDataSource});
  @override
  Future<Either<List<CategoriesEntity>, String>> getCategories() async {
    var result = await categoriesDataSource.getCategories();
    return result.fold((categoriesResponse) {
      List<CategoriesModel> categoriesModelList =
          categoriesResponse.genres ?? [];
      List<CategoriesEntity> categoriesEntityList = categoriesModelList
          .map((categoriesModel) => categoriesModel.toCategoriesEntity())
          .toList();
      return Left(categoriesEntityList);
    }, (error) {
      return Right(error);
    });
  }
}
