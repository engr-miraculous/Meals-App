import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../dummy-data.dart';
import '../widgets/meals_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const namedNav = '/catedory-meals';

  @override
  Widget build(BuildContext context) {
    final navArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = navArgs['id'];
    final String title = navArgs['title'];
    final List<Meal> categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            //  style: Theme.of(context).textTheme.title,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealsItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
