import 'package:dio/dio.dart';
import 'package:fasahny/bloc/allItems/all_items_bloc.dart';
import 'package:fasahny/bloc/favorite/favorite_bloc.dart';
import 'package:fasahny/bloc/loginRegister/login_register_bloc.dart';
import 'package:fasahny/bloc/packages/packages_bloc.dart';
import 'package:fasahny/bloc/profile/profile_bloc.dart';
import 'package:fasahny/bloc/randomImage/random_image_bloc.dart';
import 'package:fasahny/bloc/rate/rate_bloc.dart';
import 'package:fasahny/bloc/reccomend_recent_view/recommend_view_bloc.dart';
import 'package:fasahny/bloc/recentView/recent_bloc.dart';
import 'package:fasahny/bloc/seachFilter/search_filter_bloc.dart';
import 'package:fasahny/bloc/view/view_bloc.dart';
import 'package:fasahny/repository/favoriteRepo.dart';
import 'package:fasahny/repository/getAllItemsRepo.dart';
import 'package:fasahny/repository/loginRegisterRepo.dart';
import 'package:fasahny/repository/packagesRepo.dart';
import 'package:fasahny/repository/profileRepo.dart';
import 'package:fasahny/repository/rateRepo.dart';
import 'package:fasahny/repository/recommend_recent_repo.dart';
import 'package:fasahny/repository/rendomImageRepo.dart';
import 'package:fasahny/repository/searchFilter.dart';
import 'package:fasahny/repository/viewRepo.dart';
import 'package:fasahny/webService/favoriteService.dart';
import 'package:fasahny/webService/getAllItemsService.dart';
import 'package:fasahny/webService/pakagesService.dart';
import 'package:fasahny/webService/profileService.dart';
import 'package:fasahny/webService/rateService.dart';
import 'package:fasahny/webService/recommend_recent_service.dart';
import 'package:fasahny/webService/registerService.dart';
import 'package:fasahny/webService/rondamImageService.dart';
import 'package:fasahny/webService/searchFilter.dart';
import 'package:fasahny/webService/viewService.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.I;
void initGetIt(){
  getIt.registerLazySingleton<LoginRegisterBloc>(() => LoginRegisterBloc(getIt()));
  getIt.registerLazySingleton<LoginRegisterRepo>(() => LoginRegisterRepo(getIt()));
  getIt.registerLazySingleton<LoginRegisterService>(() => LoginRegisterService(Dio()));


  getIt.registerLazySingleton<ProfileBloc>(() => ProfileBloc(getIt()));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerLazySingleton<ProfileService>(() => ProfileService());

  getIt.registerLazySingleton<RandomImageBloc>(() => RandomImageBloc(getIt()));
  getIt.registerLazySingleton<RandomImageRepo>(() => RandomImageRepo(getIt()));
  getIt.registerLazySingleton<RandomImageService>(() => RandomImageService());


  getIt.registerLazySingleton<RecommendViewBloc>(() => RecommendViewBloc(getIt()));
  getIt.registerLazySingleton<RecentBloc>(() => RecentBloc(getIt()));
  getIt.registerLazySingleton<RecommendRecentRepo>(() => RecommendRecentRepo(getIt()));
  getIt.registerLazySingleton<RecommendRecentService>(() => RecommendRecentService(Dio()));

  getIt.registerLazySingleton<FavoriteBloc>(() => FavoriteBloc(getIt()));
  getIt.registerLazySingleton<FavoriteRepo>(() => FavoriteRepo(getIt()));
  getIt.registerLazySingleton<FavoriteService>(() => FavoriteService());


  getIt.registerLazySingleton<ViewBloc>(() => ViewBloc(getIt()));
  getIt.registerLazySingleton<ViewRepo>(() => ViewRepo(getIt()));
  getIt.registerLazySingleton<ViewService>(() => ViewService());


  getIt.registerLazySingleton<AllItemsBloc>(() => AllItemsBloc(getIt()));
  getIt.registerLazySingleton<GetAllItemsRepo>(() => GetAllItemsRepo(getIt()));
  getIt.registerLazySingleton<GetAllItemsService>(() => GetAllItemsService(Dio()));

  getIt.registerLazySingleton<PackagesBloc>(() => PackagesBloc(getIt()));
  getIt.registerLazySingleton<PackagesRepo>(() => PackagesRepo(getIt()));
  getIt.registerLazySingleton<PackagesService>(() => PackagesService(Dio()));

  getIt.registerLazySingleton<RateBloc>(() => RateBloc(getIt()));
  getIt.registerLazySingleton<RateRepo>(() => RateRepo(getIt()));
  getIt.registerLazySingleton<RateService>(() => RateService(Dio()));

  getIt.registerLazySingleton<SearchFilterBloc>(() => SearchFilterBloc(getIt()));
  getIt.registerLazySingleton<SearchFilterRepo>(() => SearchFilterRepo(getIt()));
  getIt.registerLazySingleton<SearchFilterService>(() => SearchFilterService(Dio()));


}
