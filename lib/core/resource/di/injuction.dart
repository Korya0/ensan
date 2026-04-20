import 'package:ensan_app/core/services/shared_pref/shared_pref.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initServices();
}

Future<void> _initServices() async {
  // SharedPref Service
  sl.registerLazySingleton<SharedPrefService>(() => SharedPrefService());
  await sl<SharedPrefService>().init();
}

class SharedPrefService {
  Future<void> init() async {
    await SharedPref.initialize();
  }
}
