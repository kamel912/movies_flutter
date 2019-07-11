import 'package:flutter/material.dart';
import 'package:movies_flutter/di/app_injector.dart';
import 'package:movies_flutter/di/app_module.dart';
import 'package:movies_flutter/ui/main_screen/main_list.dart';
import 'package:inject/inject.dart';

void main() async {
  var container = await AppInjector.create(
    AppModule(),
  );
  runApp(container.app);
}

@provide
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ThemeData(
        primaryColorDark: Color(0xff000000),
        primaryColor: Color(0xff111723),
        primaryColorLight: Color(0xff373d4b),
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<String> _appBarTitles = [
    'Home',
    'Profile',
    'Favorites',
  ];
  String _appBarTitle = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
//      body: MainList(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          activeIcon: Icon(
            Icons.home,
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            _appBarTitles[0],
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          activeIcon: Icon(
            Icons.person,
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            _appBarTitles[1],
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
          activeIcon: Icon(
            Icons.favorite,
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            _appBarTitles[2],
          ),
        ),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Theme.of(context).accentColor,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _appBarTitle = _appBarTitles[_selectedIndex];
    });
  }
}
