import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/meals_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty ? Center(
      child: Text(
        'You currntly dont have any Meal as your Favorite, Please add some.',
        softWrap: true,
        textAlign: TextAlign.center,
      ),
    ) : ListView.builder(
          itemBuilder: (context, index) {
            return MealsItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
             // removeMeal: inStateMealRemoval,
            );
          },
          itemCount: favoriteMeals.length,
        );
  }
}
