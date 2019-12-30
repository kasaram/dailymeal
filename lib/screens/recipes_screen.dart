import 'dart:ui';

import 'package:dailymeal/meals_list.dart';
import 'package:dailymeal/model/meals.dart';
import 'package:flutter/material.dart';

class RecipesScreen extends StatefulWidget {
  final Function setFavourite;
  final Function isFavourite;
  final Function removeFavourite;
  RecipesScreen(this.removeFavourite,this.isFavourite, this.setFavourite);

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String id = routeArgs['id'];
    final Meal selectedMeal = MealsList.firstWhere((meal) {
      return meal.id == id;
    });

    final String title = routeArgs['title'];
    final String imageUrl = routeArgs['imageUrl'];
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Ingredients',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 250,
                height: selectedMeal.ingredients.length * 27.00,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 3,
                        color: Colors.lightGreen,
                        child: Container(
                          color: Colors.lightGreenAccent,
                          padding: EdgeInsets.only(left: 10),
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            '${selectedMeal.ingredients[index]}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ));
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Steps",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2.0, color: Colors.grey)),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '#${index + 1}',
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.lightGreen,
                      ),
                      title: Card(
                        color: Colors.lightGreenAccent,
                        child: Container(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            '${selectedMeal.steps[index]}',
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(widget.isFavourite(selectedMeal)
              ? Icons.star
              : Icons.star_border),
          onPressed: () {
              widget.isFavourite(selectedMeal)?
                  widget.removeFavourite(selectedMeal.id):
                  widget.setFavourite(selectedMeal);
          },
        ));
  }
}
