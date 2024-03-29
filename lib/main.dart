import 'package:flutter/material.dart';


import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        home: TabsScreen(),
        routes: {
          CategoryMealsScreen.namedNav: (ctx) => CategoryMealsScreen(),
          MealDetailsScreen.navName: (ctx) => MealDetailsScreen(),
        });
  }
}
