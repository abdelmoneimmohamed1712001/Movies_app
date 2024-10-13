import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/DetailsEntity.dart';
import 'package:movies_app/domain/entities/SimilarEntity.dart';
import 'package:movies_app/domain/use_cases/get_similar_use_case.dart';
import '../../../../../../domain/use_cases/get_details_use_case.dart';

@injectable
class DetailsTabViewModel extends Cubit<DetailsTabState>{
  @factoryMethod
  DetailsTabViewModel({required this.detailsUseCase,required this.similarUseCase}):super(DetailsTabInitialState());
  GetDetailsUseCase detailsUseCase;
  GetSimilarUseCase similarUseCase;

  void getDetails(String movieId)async{
    emit(DetailsLoadingState());
    var result =await detailsUseCase.call(movieId);
    result.fold((detailsList) {
      emit(DetailsSuccessState(details: detailsList));
    }, (error) {
      emit(DetailsErrorState(error: error));
    });

  }
  void getSimilar(String movieId)async{
    emit(SimilarLoadingState());
    var result =await similarUseCase.call(movieId);
    result.fold((similarList) {
      emit(SimilarSuccessState(similar:similarList));
    }, (error) {
      emit(SimilarErrorState(error: error));
    });

  }

}
sealed class DetailsTabState{}
class DetailsTabInitialState extends DetailsTabState{}

class DetailsLoadingState extends DetailsTabState{
  String? loadingMessage;
  DetailsLoadingState({this.loadingMessage});
}
class DetailsErrorState extends DetailsTabState{
  String error;
  DetailsErrorState({required this.error});
}
class DetailsSuccessState extends DetailsTabState{
  DetailsEntity details ;
  DetailsSuccessState({required this.details});
}

class SimilarLoadingState extends DetailsTabState{
  String? loadingMessage;
  SimilarLoadingState({this.loadingMessage});
}
class SimilarErrorState extends DetailsTabState{
  String error;
  SimilarErrorState({required this.error});
}
class SimilarSuccessState extends DetailsTabState{
  List<SimilarEntity> similar ;
  SimilarSuccessState({required this.similar});
}
