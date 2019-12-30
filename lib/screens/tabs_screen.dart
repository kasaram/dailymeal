import 'package:dailymeal/model/meals.dart';
import 'package:dailymeal/screens/catogories_screen.dart';
import 'package:dailymeal/screens/drawer_screen.dart';
import 'package:dailymeal/screens/favourite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;
  TabsScreen(this.favouriteMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> pages;
  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    pages = [
      CategoriesScreen(),
      FavouriteScreen(widget.favouriteMeal),
    ];
    super.initState();
  }
  void selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DeliMeal',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedPage,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.lightGreen,
              icon: Icon(Icons.category),
              title: Text('Category')),
          BottomNavigationBarItem(
              backgroundColor: Colors.lightGreen,
              icon: Icon(Icons.star),
              title: Text('Favourite'))
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}
