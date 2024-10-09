import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';
import 'package:movies_app/domain/use_cases/get_movies_use_case.dart';

@injectable
class MoviesTabViewModel extends Cubit<MoviesTabState>{
  @factoryMethod
  MoviesTabViewModel({required this.moviesUseCase}):super(MoviesTabInitialState());
  GetMoviesUseCase moviesUseCase;

  void getCategories(String categoryId)async{
    emit(MoviesLoadingState());
    var result =await moviesUseCase.call(categoryId);
    result.fold((moviesList) {
      emit(MoviesSuccessState(movies: moviesList));
    }, (error) {
      emit(MoviesErrorState(error: error));
    });

  }

}
sealed class MoviesTabState{}
class MoviesTabInitialState extends MoviesTabState{}

class MoviesLoadingState extends MoviesTabState{
  String? loadingMessage;
  MoviesLoadingState({this.loadingMessage});
}
class MoviesErrorState extends MoviesTabState{
  String error;
  MoviesErrorState({required this.error});
}
class MoviesSuccessState extends MoviesTabState{
  List<MoviesEntity> movies ;
  MoviesSuccessState({required this.movies});
}
