import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String id;
  final String title;

  CategoryMealsScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        //  style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Center(
        child: Text('You are in $title Meals'),
      ),
    );
  }
}
