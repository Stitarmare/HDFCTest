import 'package:get_it/get_it.dart';
import 'package:hdfcTestApp/data/localdatasource/local_web_datasource.dart';
import 'package:hdfcTestApp/data/remotedatasource/get_list_breweries_datasource.dart';
import 'package:hdfcTestApp/data/repositories/get_breweries_repository_impl.dart';
import 'package:hdfcTestApp/domain/repositories/get_list_breweries_repository.dart';
import 'package:hdfcTestApp/domain/usecases/get_list_breweries.dart';
import 'package:hdfcTestApp/presentation/bloc/getbrewerie_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() {
  //usecasae
  sl.registerLazySingleton(() => GetListBreweriesUsecase(sl()));

  //bloc
  sl.registerLazySingleton(() => GetbrewerieBloc(breweriesUsecase: sl()));

  // Data Source
  sl.registerLazySingleton<GetListBreweriesRepository>(() =>
      GetListBreweriesRepositoryImpl(
          dataSource: sl(), localWebDatasource: sl()));

  //External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => RemoteDataSource());
  sl.registerLazySingleton(() => LocalWebDatasource());
}
