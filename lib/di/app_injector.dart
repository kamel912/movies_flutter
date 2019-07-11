import 'app_injector.inject.dart' as g;
import 'package:inject/inject.dart';
import 'package:movies_flutter/di/app_module.dart';

import '../main.dart';

@Injector(const [AppModule])
abstract class AppInjector {
  @provide
  MyApp get app;

  static Future<AppInjector> create(
    AppModule appModule,
  ) async =>
      await g.AppInjector$Injector.create(
        appModule,
      );
}
