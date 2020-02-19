import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../dummy-data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const navName = '/meal-details';
  @override
  Widget build(BuildContext context) {
    Widget buildTitle(String text) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget buildListContainer(Widget _child) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: _child,
      );
    }

    final argument = ModalRoute.of(context).settings.arguments as String;
    Meal selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == argument);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle('Ingredient'),
            buildListContainer(
              ListView.builder(
                itemBuilder: (BuildContext cntx, int index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildTitle('Steps'),
            buildListContainer(ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider()
                  ],
                );
              },
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
    );
  }
}
