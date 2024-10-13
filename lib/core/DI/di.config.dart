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
import '../../data/data_source_contract/details_data_source.dart' as _i8;
import '../../data/data_source_contract/movies_data_source.dart' as _i14;
import '../../data/data_source_contract/popular_data_source.dart' as _i18;
import '../../data/data_source_contract/releases_data_source.dart' as _i22;
import '../../data/data_source_contract/similar_data_source.dart' as _i26;
import '../../data/data_source_impl/categories_data_source_impl.dart' as _i5;
import '../../data/data_source_impl/details_data_source_impl.dart' as _i9;
import '../../data/data_source_impl/movies_data_source_impl.dart' as _i15;
import '../../data/data_source_impl/popular_data_source_impl.dart' as _i19;
import '../../data/data_source_impl/releases_data_source_impl.dart' as _i23;
import '../../data/data_source_impl/similar_data_source_impl.dart' as _i27;
import '../../data/repository_impl/categories_repository_impl.dart' as _i7;
import '../../data/repository_impl/details_repository_impl.dart' as _i11;
import '../../data/repository_impl/movies_repository_impl.dart' as _i17;
import '../../data/repository_impl/popular_repository_impl.dart' as _i21;
import '../../data/repository_impl/releases_repository_imp.dart' as _i25;
import '../../data/repository_impl/similar_repository_impl.dart' as _i29;
import '../../domain/repository_contract/categories_repository.dart' as _i6;
import '../../domain/repository_contract/details_repository.dart' as _i10;
import '../../domain/repository_contract/movies_repository.dart' as _i16;
import '../../domain/repository_contract/popular_repository.dart' as _i20;
import '../../domain/repository_contract/releases_repository.dart' as _i24;
import '../../domain/repository_contract/similar_repository.dart' as _i28;
import '../../domain/use_cases/get_categories_use_case.dart' as _i12;
import '../../domain/use_cases/get_details_use_case.dart' as _i13;
import '../../domain/use_cases/get_movies_use_case.dart' as _i31;
import '../../domain/use_cases/get_popular_use_case.dart' as _i32;
import '../../domain/use_cases/get_releases_use_case.dart' as _i33;
import '../../domain/use_cases/get_similar_use_case.dart' as _i34;
import '../../presentation/home/details_screen/view_model/details_tab_view_model.dart'
    as _i37;
import '../../presentation/home/tabs/browse_tab/movies_screen/view_model/movies_tab_view_model.dart'
    as _i36;
import '../../presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart'
    as _i30;
import '../../presentation/home/tabs/home_tab/view_model/home_tab_view_model.dart'
    as _i35;
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
    gh.factory<_i8.DetailsDataSource>(
        () => _i9.DetailsDataSourceImpl(apiDataSource: gh<_i3.ApiManager>()));
    gh.factory<_i10.DetailsRepository>(() => _i11.DetailsRepositoryImpl(
        detailsDataSource: gh<_i8.DetailsDataSource>()));
    gh.factory<_i12.GetCategoriesUseCase>(() => _i12.GetCategoriesUseCase(
        categoriesRepository: gh<_i6.CategoriesRepository>()));
    gh.factory<_i13.GetDetailsUseCase>(() => _i13.GetDetailsUseCase(
        detailsRepository: gh<_i10.DetailsRepository>()));
    gh.factory<_i14.MoviesDataSource>(
        () => _i15.MoviesDataSourceImpl(apiDataSource: gh<_i3.ApiManager>()));
    gh.factory<_i16.MoviesRepository>(() => _i17.MoviesRepositoryImpl(
        moviesDataSource: gh<_i14.MoviesDataSource>()));
    gh.factory<_i18.PopularDataSource>(
        () => _i19.PopularDataSourceImpl(apiDatasource: gh<_i3.ApiManager>()));
    gh.factory<_i20.PopularRepository>(() => _i21.PopularRepositoryImpl(
        popularDataSource: gh<_i18.PopularDataSource>()));
    gh.factory<_i22.ReleasesDataSource>(
        () => _i23.ReleasesDataSourceImpl(apiDataSource: gh<_i3.ApiManager>()));
    gh.factory<_i24.ReleasesRepository>(() => _i25.ReleasesRepositoryImpl(
        releasesDataSource: gh<_i22.ReleasesDataSource>()));
    gh.factory<_i26.SimilarDataSource>(
        () => _i27.SimilarDataSourceImpl(apiDataSource: gh<_i3.ApiManager>()));
    gh.factory<_i28.SimilarRepository>(() => _i29.SimilarRepositoryImpl(
        similarDataSource: gh<_i26.SimilarDataSource>()));
    gh.factory<_i30.BrowseTabViewModel>(() => _i30.BrowseTabViewModel(
        categoriesUseCase: gh<_i12.GetCategoriesUseCase>()));
    gh.factory<_i31.GetMoviesUseCase>(() =>
        _i31.GetMoviesUseCase(moviesRepository: gh<_i16.MoviesRepository>()));
    gh.factory<_i32.GetPopularUseCase>(() => _i32.GetPopularUseCase(
        popularRepository: gh<_i20.PopularRepository>()));
    gh.factory<_i33.GetReleasesUseCase>(() => _i33.GetReleasesUseCase(
        releasesRepository: gh<_i24.ReleasesRepository>()));
    gh.factory<_i34.GetSimilarUseCase>(() => _i34.GetSimilarUseCase(
        similarRepository: gh<_i28.SimilarRepository>()));
    gh.factory<_i35.HomeTabViewModel>(() => _i35.HomeTabViewModel(
          popularUseCase: gh<_i32.GetPopularUseCase>(),
          releasesUseCase: gh<_i33.GetReleasesUseCase>(),
        ));
    gh.factory<_i36.MoviesTabViewModel>(() =>
        _i36.MoviesTabViewModel(moviesUseCase: gh<_i31.GetMoviesUseCase>()));
    gh.factory<_i37.DetailsTabViewModel>(() => _i37.DetailsTabViewModel(
          detailsUseCase: gh<_i13.GetDetailsUseCase>(),
          similarUseCase: gh<_i34.GetSimilarUseCase>(),
        ));
    return this;
  }
}
