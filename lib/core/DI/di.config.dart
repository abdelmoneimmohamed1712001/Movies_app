// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source_contract/popular_data_source.dart' as _i4;
import '../../data/data_source_contract/releases_data_source.dart' as _i8;
import '../../data/data_source_impl/popular_data_source_impl.dart' as _i5;
import '../../data/data_source_impl/releases_data_source_impl.dart' as _i9;
import '../../data/repository_impl/popular_repository_impl.dart' as _i7;
import '../../data/repository_impl/releases_repository_imp.dart' as _i11;
import '../../domain/repository_contract/popular_repository.dart' as _i6;
import '../../domain/repository_contract/releases_repository.dart' as _i10;
import '../../domain/use_cases/get_popular_use_case.dart' as _i12;
import '../../domain/use_cases/get_releases_use_case.dart' as _i13;
import '../../presentation/home/tabs/home_tab/view_model/home_tab_view_model.dart'
    as _i14;
import '../api/api_manager/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.PopularDataSource>(
        () => _i5.PopularDataSourceImpl(apiDatasource: gh<_i3.ApiManager>()));
    gh.factory<_i6.PopularRepository>(() => _i7.PopularRepositoryImpl(
        popularDataSource: gh<_i4.PopularDataSource>()));
    gh.factory<_i8.ReleasesDataSource>(
        () => _i9.ReleasesDataSourceImpl(apiDataSource: gh<_i3.ApiManager>()));
    gh.factory<_i10.ReleasesRepository>(() => _i11.ReleasesRepositoryImpl(
        releasesDataSource: gh<_i8.ReleasesDataSource>()));
    gh.factory<_i12.GetPopularUseCase>(() =>
        _i12.GetPopularUseCase(popularRepository: gh<_i6.PopularRepository>()));
    gh.factory<_i13.GetReleasesUseCase>(() => _i13.GetReleasesUseCase(
        releasesRepository: gh<_i10.ReleasesRepository>()));
    gh.factory<_i14.HomeTabViewModel>(() => _i14.HomeTabViewModel(
          popularUseCase: gh<_i12.GetPopularUseCase>(),
          releasesUseCase: gh<_i13.GetReleasesUseCase>(),
        ));
    return this;
  }
}
