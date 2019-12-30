import 'package:dailymeal/model/meals.dart';
import 'package:dailymeal/widgets/meal_item.dart';
import 'package:dailymeal/meals_list.dart';
import 'package:flutter/material.dart';
class CategoryMealScreen extends StatefulWidget {
  final List<Meal> availableMeal;
  CategoryMealScreen(this.availableMeal);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String title;
  List<Meal> displayedMeal;
  bool loadedInitData=false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(loadedInitData==false){
      final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
      title=routeArgs['title'];
      final String id=routeArgs['id'];
      displayedMeal=widget.availableMeal.where((meal){
        return meal.categories.contains(id);
      }).toList();
      loadedInitData=true;
    }

    super.didChangeDependencies();
  }
  void removeItem(String id){
    setState(() {
      displayedMeal.removeWhere((meal){
        return meal.id==id;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: ListView.builder(itemBuilder: (context,index){
        return MealItem(
          id: displayedMeal[index].id,
          title: displayedMeal[index].title,
          imageUrl: displayedMeal[index].imageUrl,
          duration: displayedMeal[index].duration,
          complexity: displayedMeal[index].complexity,
          affordability: displayedMeal[index].affordability,
          removeItem: removeItem,
        );
      },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
