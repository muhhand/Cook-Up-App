import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourite_screen.dart';

import '../modules/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {

  static const routeName = 'tabs';

  final List<Meal> favouriteMeals;

  TabsScreen( this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


  List<Map<String,Object>> _pages;

  @override
  void initState(){
    _pages = [
      {
        'page' : categoriesScreen(),
        'title' : 'Categories',
      },
      {
        'page' : FavoriteScreen(widget.favouriteMeals),
        'title' : 'Your Favorite',
      },
    ];
  }

  int _selectedPageIndex = 0;
  void _selectPage(int value) {
    setState((){
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'],style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }


}
