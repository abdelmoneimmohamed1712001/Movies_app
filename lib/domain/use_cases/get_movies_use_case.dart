import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/movies_repository.dart';

import '../entities/MoviesEntity.dart';
@injectable
class GetMoviesUseCase {
  MoviesRepository moviesRepository;
  @factoryMethod
  GetMoviesUseCase({required this.moviesRepository});
  Future<Either<List<MoviesEntity>, String>> call(String categoryId){
   return moviesRepository.getMovies(categoryId);
  }
}