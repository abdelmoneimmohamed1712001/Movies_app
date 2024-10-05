import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/popular_repository.dart';

import '../entities/PopularEntity.dart';
@injectable
class GetPopularUseCase{
PopularRepository popularRepository;
@factoryMethod
GetPopularUseCase({required this.popularRepository});
Future<Either<List<PopularEntity>,String>>call(){
  return popularRepository.getPopular();
}
}