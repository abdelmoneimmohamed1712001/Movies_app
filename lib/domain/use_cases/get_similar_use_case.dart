import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/similar_repository.dart';
import '../entities/SimilarEntity.dart';
@injectable
class GetSimilarUseCase{
  SimilarRepository similarRepository;
  @factoryMethod
  GetSimilarUseCase({required this.similarRepository});
  Future<Either<List<SimilarEntity>, String>> call(String movieId){
    return similarRepository.getSimilar(movieId);
  }
}