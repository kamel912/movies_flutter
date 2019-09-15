import 'app_injector.dart' as _i1;
import 'app_module.dart' as _i2;
import 'package:dio/src/dio.dart' as _i3;
import '../repositories/movies_repository.dart' as _i4;
import '../blocs/movies_bloc.dart' as _i5;
import 'dart:async' as _i6;
import '../main.dart' as _i7;
import '../ui/home_page.dart' as _i8;
import '../ui/main_screen/main_screen.dart' as _i9;
import '../api/connection.dart' as _i10;

class AppInjector$Injector implements _i1.AppInjector {
  AppInjector$Injector._(this._appModule);

  final _i2.AppModule _appModule;

  _i3.Dio _singletonDio;

  _i4.MoviesRepository _singletonMoviesRepository;

  _i5.MoviesBloc _singletonMoviesBloc;

  static _i6.Future<_i1.AppInjector> create(_i2.AppModule appModule) async {
    final injector = AppInjector$Injector._(appModule);

    return injector;
  }

  _i7.MyApp _createMyApp() => _i7.MyApp(_createHomePage);
  _i8.HomePage _createHomePage() => _i8.HomePage(_createMainScreen());
  _i9.MainScreen _createMainScreen() => _i9.MainScreen(_createMoviesBloc());
  _i5.MoviesBloc _createMoviesBloc() =>
      _singletonMoviesBloc ??= _i5.MoviesBloc(_createMoviesRepository());
  _i4.MoviesRepository _createMoviesRepository() =>
      _singletonMoviesRepository ??= _i4.MoviesRepository(_createApiProvider());
  _i10.ApiProvider _createApiProvider() => _i10.ApiProvider(_createDio());
  _i3.Dio _createDio() => _singletonDio ??= _appModule.dio();
  @override
  _i7.MyApp get app => _createMyApp();
  @override
  _i8.HomePage get homePage => _createHomePage();
}
