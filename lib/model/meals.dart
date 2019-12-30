enum Affordability{
  Affordable,
  Pricey,
  Luxurious
}
enum Complexity{
  Simple,
  Challenging,
  Hard
}
class Meal{
  String id;
  List<String> categories;
  String title;
  Affordability affordability;
  Complexity complexity;
  String imageUrl;
  int duration;
  List<String> ingredients;
  List<String> steps;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;

  Meal({
   this.id,
   this.categories,
    this.title,
    this.affordability,
    this.complexity,
    this.imageUrl,
    this.duration,
    this.ingredients,
    this.steps,
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.isLactoseFree
  });
}