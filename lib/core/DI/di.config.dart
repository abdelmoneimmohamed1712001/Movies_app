// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source_contract/categories_data_source.dart' as _i4;
import '../../data/data_source_contract/movies_data_source.dart' as _i9;
import '../../data/data_source_contract/popular_data_source.dart' as _i13;
import '../../data/data_source_contract/releases_data_source.dart' as _i17;
import '../../data/data_source_impl/categories_data_source_impl.dart' as _i5;
import '../../data/data_source_impl/movies_data_source_impl.dart' as _i10;
import '../../data/data_source_impl/popular_data_source_impl.dart' as _i14;
import '../../data/data_source_impl/releases_data_source_impl.dart' as _i18;
import '../../data/repository_impl/categories_repository_impl.dart' as _i7;
import '../../data/repository_impl/movies_repository_impl.dart' as _i12;
import '../../data/repository_impl/popular_repository_impl.dart' as _i16;
import '../../data/repository_impl/releases_repository_imp.dart' as _i20;
import '../../domain/repository_contract/categories_repository.dart' as _i6;
import '../../domain/repository_contract/movies_repository.dart' as _i11;
import '../../domain/repository_contract/popular_repository.dart' as _i15;
import '../../domain/repository_contract/releases_repository.dart' as _i19;
import '../../domain/use_cases/get_categories_use_case.dart' as _i8;
import '../../domain/use_cases/get_movies_use_case.dart' as _i22;
import '../../domain/use_cases/get_popular_use_case.dart' as _i23;
import '../../domain/use_cases/get_releases_use_case.dart' as _i24;
import '../../presentation/home/tabs/browse_tab/movies_screen/view_model/movies_tab_view_model.dart'
    as _i26;
import '../../presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart'
    as _i21;
import '../../presentation/home/tabs/home_tab/view_model/home_tab_view_model.dart'
    as _i25;
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
    gh.factory<_i4.CategoriesDataSource>(() =>
        _i5.CategoriesDataSourceImpl(apiDataSource: gh<_i3.ApiManager>()));
    gh.factory<_i6.CategoriesRepository>(() => _i7.CategoriesRepositoryImpl(
        categoriesDataSource: gh<_i4.CategoriesDataSource>()));
    gh.factory<_i8.GetCategoriesUseCase>(() => _i8.GetCategoriesUseCase(
        categoriesRepository: gh<_i6.CategoriesRepository>()));
    gh.factory<_i9.MoviesDataSource>(
        () => _i10.MoviesDataSourceImpl(apiDataSource: gh<_i3.ApiManager>()));
    gh.factory<_i11.MoviesRepository>(() => _i12.MoviesRepositoryImpl(
        moviesDataSource: gh<_i9.MoviesDataSource>()));
    gh.factory<_i13.PopularDataSource>(
        () => _i14.PopularDataSourceImpl(apiDatasource: gh<_i3.ApiManager>()));
    gh.factory<_i15.PopularRepository>(() => _i16.PopularRepositoryImpl(
        popularDataSource: gh<_i13.PopularDataSource>()));
    gh.factory<_i17.ReleasesDataSource>(
        () => _i18.ReleasesDataSourceImpl(apiDataSource: gh<_i3.ApiManager>()));
    gh.factory<_i19.ReleasesRepository>(() => _i20.ReleasesRepositoryImpl(
        releasesDataSource: gh<_i17.ReleasesDataSource>()));
    gh.factory<_i21.BrowseTabViewModel>(() => _i21.BrowseTabViewModel(
        categoriesUseCase: gh<_i8.GetCategoriesUseCase>()));
    gh.factory<_i22.GetMoviesUseCase>(() =>
        _i22.GetMoviesUseCase(moviesRepository: gh<_i11.MoviesRepository>()));
    gh.factory<_i23.GetPopularUseCase>(() => _i23.GetPopularUseCase(
        popularRepository: gh<_i15.PopularRepository>()));
    gh.factory<_i24.GetReleasesUseCase>(() => _i24.GetReleasesUseCase(
        releasesRepository: gh<_i19.ReleasesRepository>()));
    gh.factory<_i25.HomeTabViewModel>(() => _i25.HomeTabViewModel(
          popularUseCase: gh<_i23.GetPopularUseCase>(),
          releasesUseCase: gh<_i24.GetReleasesUseCase>(),
        ));
    gh.factory<_i26.MoviesTabViewModel>(() =>
        _i26.MoviesTabViewModel(moviesUseCase: gh<_i22.GetMoviesUseCase>()));
    return this;
  }
}
