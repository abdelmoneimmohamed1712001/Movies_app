import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/releases_repository.dart';

import '../entities/ReleasesEntity.dart';
@injectable
class GetReleasesUseCase{
  ReleasesRepository releasesRepository;
  @factoryMethod
  GetReleasesUseCase({required this.releasesRepository});
  Future<Either<List<ReleasesEntity>, String>> call(){
    return releasesRepository.getReleases();
  }
}