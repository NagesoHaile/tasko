import 'package:get_it/get_it.dart';
import 'package:tasko/core/helper/localdb.dart';
import 'package:tasko/features/home/bloc/task_bloc.dart';
import 'package:tasko/features/settings/bloc/settings_bloc.dart';
import 'package:tasko/features/settings/services/settings_service.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
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
}
