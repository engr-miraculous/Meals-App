import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import './screens/meal_details_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './dummy-data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> preferdMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  Map<String, bool> filltersStateTruth = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false
  };

  void _changeFilters(newFillterState) {
    filltersStateTruth = newFillterState;

    preferdMeals = DUMMY_MEALS.where((meal) {
      if (filltersStateTruth['isGlutenFree'] && !meal.isGlutenFree) {
        return false;
      }
      if (filltersStateTruth['isVegan'] && !meal.isVegan) {
        return false;
      }
      if (filltersStateTruth['isVegetarian'] && !meal.isVegetarian) {
        return false;
      }
      if (filltersStateTruth['isLactoseFree'] && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();
  }

  void toggleFavorites(String id) {
    var favoriteMealIndex = favoriteMeals.indexWhere((meal) {
      return meal.id == id;
    });

    if (favoriteMealIndex >= 0) {
      favoriteMeals.removeAt(favoriteMealIndex);
    } else {
      favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) {
        return meal.id == id;
      }));
    }
  }

  bool isFavoriteMeal(String id){
    return favoriteMeals.any((meal){
      return meal.id == id;
    }
    
    );
  
  }

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
        home: TabsScreen(favoriteMeals),
        routes: {
          CategoryMealsScreen.namedNav: (ctx) =>
              CategoryMealsScreen(preferdMeals),
          MealDetailsScreen.navName: (ctx) => MealDetailsScreen(toggleFavorites, isFavoriteMeal),
          FiltersScreen.navName: (ctx) =>
              FiltersScreen(filltersStateTruth, _changeFilters),
        });
  }
}
