import 'package:flutter/material.dart';

import './category_screen.dart';
import './favorite_screen.dart';
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meal App'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favorite',
            ),
          ]),
        ),
        body: TabBarView(children: [
          CategoryScreen(),
          FavoriteScreen()
        ]),
      ),
    );
  }
}
