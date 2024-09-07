import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tasko/core/helper/localdb.dart';
import 'package:tasko/features/home/bloc/task_bloc.dart';
import 'package:tasko/features/show_quote/data/data_sources/quote_api_service.dart';
import 'package:tasko/features/show_quote/data/repositories/quote_repository_impl.dart';
import 'package:tasko/features/show_quote/domain/repositories/quote_repository.dart';
import 'package:tasko/features/show_quote/domain/use_cases/quote_use_case.dart';
import 'package:tasko/features/show_quote/presentation/bloc/quote_bloc.dart';
import 'package:tasko/features/settings/bloc/settings_bloc.dart';
import 'package:tasko/features/settings/services/settings_service.dart';
import 'package:tasko/router.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  final dio = Dio();

  sl.registerSingleton<Dio>(dio);
  sl.registerSingletonAsync<LocalDB>(
    () async {
      LocalDB localDB = LocalDB();
      await localDB.init();
      return localDB;
    },
    signalsReady: true,
  );
  sl.registerSingleton<SettingsService>(SettingsService());
  sl.registerFactory<SettingsBloc>(() => SettingsBloc(sl()));

  // task
  sl.registerFactory<TaskBloc>(() => TaskBloc());

  // quote
  sl.registerSingleton<QuoteApiService>(QuoteApiService(sl()));
  sl.registerSingleton<QuoteRepository>(
      QuoteRepositoryImpl(quoteApiService: sl()));
  sl.registerSingleton<QuoteUseCase>(QuoteUseCase(quoteRepository: sl()));
  sl.registerFactory<QuoteBloc>(() => QuoteBloc(sl()));

  // router
  sl.registerSingleton<GoRouter>(router);
}
