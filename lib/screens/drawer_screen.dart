import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  void pageSettings(BuildContext context) {
    Navigator.of(context)
        .pushReplacementNamed('/settings_screen', arguments: {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 250,
              child: Stack(
                children: <Widget>[
                  Image.network(
                    'https://www.flavcity.com/wp-content/uploads/2018/05/healthy-meal-prep-recipes.jpg',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10,

                    child: Container(
                      width: 304,
                      color: Colors.black.withOpacity(0.3),
                      child: Center(
                        child: Text(
                          "DeliMeal",
                          style: TextStyle(fontSize: 30,color: Colors.white,letterSpacing: 3,),

                        ),
                      ),
                    ),
                  )

                ],
              )
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text(
              'Meals',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/tabs_screen');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              pageSettings(context);
            },
          )
        ],
      ),
    );
  }
}
