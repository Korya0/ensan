// ignore_for_file: unused_import

import 'package:device_preview/device_preview.dart';
import 'package:ensan_app/core/resource/di/injuction.dart';
import 'package:ensan_app/core/resource/extensions/context_extension.dart';
import 'package:ensan_app/core/resource/router/app_router.dart';
import 'package:ensan_app/core/resource/style/theme/app_theme.dart';
import 'package:ensan_app/core/utils/bloc_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjector();
  Bloc.observer = AppBlocObserver();
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => EnsanApp()),
    // EnsanApp(),
  );
}

class EnsanApp extends StatelessWidget {
  const EnsanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: GestureDetector(
              onTap: () => context.unFocus(),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
