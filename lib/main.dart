import 'package:flutter/material.dart';
import 'package:movies_flutter/di/app_injector.dart';
import 'package:movies_flutter/di/app_module.dart';
import 'package:movies_flutter/ui/home_page.dart';
import 'package:inject/inject.dart';
import 'package:flutter/services.dart';

typedef Provider<T> = T Function();

void main() async {
  var container = await AppInjector.create(
    AppModule(),
  );
  runApp(container.app);
}

@provide
class MyApp extends StatelessWidget {
  final Provider<HomePage> homePage;

  const MyApp(
    this.homePage,
  ) : super();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color(0xff111723),
      statusBarIconBrightness: Brightness.light,

    ));
    return MaterialApp(
//      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ThemeData(
        primaryColorDark: Color(0xff111723),
        primaryColor: Color(0xff373d4b),
        primaryColorLight: Color(0xff616777),
        accentColor: Color(0xffFFEB3B),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
          ),
          body1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: homePage(),
    );
  }
}
