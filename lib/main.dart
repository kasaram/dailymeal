import 'package:dailymeal/meals_list.dart';
import 'package:dailymeal/screens/category_meals_screen.dart';
import 'package:dailymeal/screens/recipes_screen.dart';
import 'package:dailymeal/screens/settings_screen.dart';
import 'package:dailymeal/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import 'model/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> filters={
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> availableMeal=MealsList;
  List<Meal> favouriteMeal=[];

  void setFilters(Map<String,bool> newFilters){
    setState(() {
      filters=newFilters;
      availableMeal=MealsList.where((meal){
        if(filters['gluten'] && !meal.isGlutenFree){
          return false;
        }
        if(filters['lactose'] && !meal.isLactoseFree){
          return false;
        }
        if(filters['vegetarian'] && !meal.isVegetarian){
          return false;
        }
        if(filters['vegan'] && !meal.isVegan){
          return false;
        }
        return true;
      }).toList();
    });

  }

  void setFavourite(Meal favMeal){
    setState(() {
      favouriteMeal.add(favMeal);
    });

  }
  void removeFavourite(String id){
    setState(() {
      favouriteMeal.removeWhere((meal){
        return meal.id==id;
      });
    });
  }
  bool isFavourite(Meal meal){
    if(favouriteMeal.contains(meal)){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.lightGreen,
          accentColor: Colors.lightGreenAccent,
          fontFamily: 'Roboto'),
      home: TabsScreen(favouriteMeal),
      routes: {
        '/meals_screen': (ctx) => CategoryMealScreen(availableMeal),
        '/recipes_screen': (ctx) => RecipesScreen(removeFavourite,isFavourite,setFavourite),
        '/settings_screen': (ctx) => SettingsScreen(filters,setFilters),
        '/tabs_screen': (ctx) => TabsScreen(favouriteMeal),
      },
    );
  }
}
