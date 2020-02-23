import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buidListTile(String title, IconData icon, Function tapHandller) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 26,
        ),
      ),
      onTap: tapHandller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            child: Text(
              'Cook It',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buidListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buidListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(
                FiltersScreen.navName,
              );
            },
          )
        ],
      ),
    );
  }
}
