import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/details_repository.dart';

import '../entities/DetailsEntity.dart';
@injectable
class GetDetailsUseCase{
  DetailsRepository detailsRepository;
  @factoryMethod
  GetDetailsUseCase({required this.detailsRepository});
  Future<Either<DetailsEntity, String>> call(String movieId){
   return detailsRepository.getMovies(movieId);
  }
}