import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/use_cases/get_categories_use_case.dart';

import '../../../../../domain/entities/CategoriesEntity.dart';
@injectable
class BrowseTabViewModel extends Cubit<BrowseTabState>{
  @factoryMethod
  BrowseTabViewModel({required this.categoriesUseCase}):super(BrowseTabInitialState());
  GetCategoriesUseCase categoriesUseCase;

  void getCategories()async{
    emit(BrowseLoadingState());
    var result =await categoriesUseCase.call();
    result.fold((categoriesList) {
      emit(BrowseSuccessState(categories: categoriesList));
    }, (error) {
      emit(BrowseErrorState(error: error));
    });

  }

}
sealed class BrowseTabState{}
class BrowseTabInitialState extends BrowseTabState{}

class BrowseLoadingState extends BrowseTabState{
  String? loadingMessage;
  BrowseLoadingState({this.loadingMessage});
}
class BrowseErrorState extends BrowseTabState{
  String error;
  BrowseErrorState({required this.error});
}
class BrowseSuccessState extends BrowseTabState{
  List<CategoriesEntity> categories ;
  BrowseSuccessState({required this.categories});
}
