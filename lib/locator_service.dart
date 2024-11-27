import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urfu_navigator_mobile/core/platform/network_info.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/floor/floor_local_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/floor/floor_remote_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/institutes/institutes_local_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/institutes/institutes_remote_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/path/path_local_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/path/path_remote_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/points/points_local_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/points/points_remote_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/search/search_local_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/datasources/search/search_remote_data_source.dart';
import 'package:urfu_navigator_mobile/feature/data/repositories/floor_repository_impl.dart';
import 'package:urfu_navigator_mobile/feature/data/repositories/institutes_repository_impl.dart';
import 'package:urfu_navigator_mobile/feature/data/repositories/path_repository_impl.dart';
import 'package:urfu_navigator_mobile/feature/data/repositories/points_repository_impl.dart';
import 'package:urfu_navigator_mobile/feature/data/repositories/search_repository_impl.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/floor_repository.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/institute_repository.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/path_repository.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/point_repository.dart';
import 'package:urfu_navigator_mobile/feature/domain/repositories/search_repository.dart';
import 'package:urfu_navigator_mobile/feature/domain/usecases/get_floor.dart';
import 'package:urfu_navigator_mobile/feature/domain/usecases/get_institute.dart';
import 'package:urfu_navigator_mobile/feature/domain/usecases/get_institutes.dart';
import 'package:urfu_navigator_mobile/feature/domain/usecases/get_path.dart';
import 'package:urfu_navigator_mobile/feature/domain/usecases/get_point.dart';
import 'package:urfu_navigator_mobile/feature/domain/usecases/get_points.dart';
import 'package:urfu_navigator_mobile/feature/domain/usecases/get_search_points.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/floor/floor_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/institute/institute_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/institutes/institutes_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/path/path_bloc.dart';
import 'package:urfu_navigator_mobile/feature/ui/bloc/search/search_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLOC / Cubit
  sl.registerFactory(() => FloorBloc(getFloor: sl()));
  sl.registerFactory(() => InstituteBloc(getInstitute: sl()));
  sl.registerFactory(() => InstitutesBloc(getInstitutes: sl()));
  sl.registerFactory(() => PathBloc(getPath: sl()));
  sl.registerFactory(() => SearchBloc(getSearchPoints: sl()));
  // UseCases
  sl.registerLazySingleton(() => GetFloor(sl()));
  sl.registerLazySingleton(() => GetInstitute(sl()));
  sl.registerLazySingleton(() => GetInstitutes(sl()));
  sl.registerLazySingleton(() => GetPath(sl()));
  sl.registerLazySingleton(() => GetPoint(sl()));
  sl.registerLazySingleton(() => GetPoints(sl()));
  sl.registerLazySingleton(() => GetSearchPoints(sl()));
  // Repository
  sl.registerLazySingleton<FloorRepository>(() => FloorRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<FloorRemoteDataSource>(
      () => FloorRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<FloorLocalDataSource>(
      () => FloorLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<InstituteRepository>(() => InstitutesRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<InstitutesRemoteDataSource>(
      () => InstitutesRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<InstitutesLocalDataSource>(
      () => InstitutesLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<PathRepository>(() => PathRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<PathRemoteDataSource>(
      () => PathRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<PathLocalDataSource>(
      () => PathLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<PointRepository>(() => PointsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<PointsRemoteDataSource>(
      () => PointsRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<PointsLocalDataSource>(
      () => PointsLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<SearchLocalDataSource>(
      () => SearchLocalDataSourceImpl(sharedPreferences: sl()));
  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
