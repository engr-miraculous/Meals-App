import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meals_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const namedNav = '/catedory-meals';
  final List<Meal> preferedMeals;
 
  CategoryMealsScreen(this.preferedMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var didChangeDependenciesExecuted = false;
  String title;
  List<Meal> displayedMeals;

  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!didChangeDependenciesExecuted) {
      final navArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final String id = navArgs['id'];
      title = navArgs['title'];
      displayedMeals = widget.preferedMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      didChangeDependenciesExecuted = true;
    }
    super.didChangeDependencies();
  }

  void inStateMealRemoval(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) {
        return meal.id == mealId;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
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
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
             // removeMeal: inStateMealRemoval,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
