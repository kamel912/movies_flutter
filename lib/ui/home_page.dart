import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'package:movies_flutter/ui/main_screen/main_screen.dart';

class HomePage extends StatefulWidget {
  final MainScreen mainScreen;

  @provide
  @singleton
  HomePage(
    this.mainScreen,
  );

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SafeArea(
        top: true,
        child: widget.mainScreen,
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColorDark,
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          activeIcon: Icon(
            Icons.home,
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            'Home',
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColorDark,
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          activeIcon: Icon(
            Icons.search,
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            'Search',
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColorDark,
          icon: Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
          activeIcon: Icon(
            Icons.favorite,
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            'Favorites',
          ),
        ),
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColorDark,
          icon: Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
          activeIcon: Icon(
            Icons.person,
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            'Profile',
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
    });
  }
}
