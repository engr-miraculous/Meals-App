import 'package:flutter/material.dart';

import '../models/meal.dart';
import './category_screen.dart';
import './favorite_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  List<Map<String, Object>> _pageNavbarObject;
  @override
  void initState() {
    _pageNavbarObject = [
      {'page': CategoryScreen(), 'title': 'Category'},
      {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Favorite'}
    ];
    // TODO: implement initState
    super.initState();
  }

  void _selecBottomNav(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageNavbarObject[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pageNavbarObject[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selecBottomNav,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Category'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favorite'),
            ),
          ]),
    );
  }
}
