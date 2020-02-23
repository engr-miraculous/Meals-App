import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const navName = '/filters-screen';
  final Function changeFilters;
  final Map<String, bool> filltersStateTruth;

  FiltersScreen(this.filltersStateTruth, this.changeFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;

  initState() {
    isGlutenFree = widget.filltersStateTruth['isGlutenFree'];
    isVegan = widget.filltersStateTruth['isVegan'];
    isVegetarian = widget.filltersStateTruth['isVegetarian'];
    isLactoseFree = widget.filltersStateTruth['isLactoseFree'];
    super.initState();
  }

  Widget buildSwitchListTile(
      {String title,
      String subTitle,
      bool currentValue,
      Function switchState}) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: switchState,
      //secondary: Divider(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final newFilltersState = {
                  'isGlutenFree': isGlutenFree,
                  'isVegan': isVegan,
                  'isVegetarian': isVegetarian,
                  'isLactoseFree': isLactoseFree
                };

                widget.changeFilters(newFilltersState);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Set Your Meal Preferences',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  title: 'Gluten-Free',
                  currentValue: isGlutenFree,
                  subTitle: 'Removes all Meals that contain Gluten',
                  switchState: (newValue) {
                    setState(() {
                      isGlutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: 'Vegan',
                  currentValue: isVegan,
                  subTitle: 'Removes all Meals that are not Vegan',
                  switchState: (newValue) {
                    setState(() {
                      isVegan = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: 'Vegetarian',
                  currentValue: isVegetarian,
                  subTitle: 'Removes all Meals that are not Vegetarian',
                  switchState: (newValue) {
                    setState(() {
                      isVegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  title: 'Lactose-Free',
                  currentValue: isLactoseFree,
                  subTitle: 'Removes all Meals that contain Lactose',
                  switchState: (newValue) {
                    setState(() {
                      isLactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
