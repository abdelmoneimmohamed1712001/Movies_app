import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/use_cases/get_popular_use_case.dart';
import 'package:movies_app/domain/use_cases/get_releases_use_case.dart';

import '../../../../../domain/entities/PopularEntity.dart';
import '../../../../../domain/entities/ReleasesEntity.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabState>{
@factoryMethod
  HomeTabViewModel({required this.popularUseCase,required this.releasesUseCase}):super(HomeTabInitialState());
  GetPopularUseCase popularUseCase;
  GetReleasesUseCase releasesUseCase;

void getPopular()async{
  emit(PopularLoadingState());
  var result =await popularUseCase.call();
  result.fold((popularList) {
    emit(PopularSuccessState(popular: popularList));
  },(error) {
    emit(PopularErrorState(error: error));
          });
}

void getReleases()async{
  emit(ReleasesLoadingState());
  var result = await releasesUseCase.call();
  result.fold((releases){
    emit(ReleasesSuccessState(releases: releases));
  }, (error) {
    emit(ReleasesErrorState(error: error));
  });
}


}
sealed class HomeTabState{}
class HomeTabInitialState extends HomeTabState{}

class PopularLoadingState extends HomeTabState{
String? loadingState;
PopularLoadingState({this.loadingState});
}
class PopularErrorState extends HomeTabState{
  String? error;
  PopularErrorState({required this.error});
}
class PopularSuccessState extends HomeTabState{
List<PopularEntity>popular;
PopularSuccessState({required this.popular});
}

class ReleasesLoadingState extends HomeTabState{
String? loadingState;
ReleasesLoadingState({this.loadingState});
}
class ReleasesErrorState extends HomeTabState{
  String? error;
  ReleasesErrorState({required this.error});
}
class ReleasesSuccessState extends HomeTabState{
List<ReleasesEntity>releases;
ReleasesSuccessState({required this.releases});
}
