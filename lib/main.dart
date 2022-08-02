import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/filters_Screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/splash_Screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'modules/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

void _setFilters ( Map<String,bool> _filterData){
  setState((){
    _filters = _filterData;

    _availableMeals = DUMMY_MEALS.where((meal) {
      if(_filters['gluten'] && !meal.isGlutenFree){
        return false;
      };
      if(_filters['lactose'] && !meal.isLactoseFree){
        return false;
      };
      if(_filters['vegan'] && !meal.isVegan){
        return false;
      };
      if(_filters['vegetarian'] && !meal.isVegetarian){
        return false;
      };
      return true;
    }).toList();
  });
}

void _toggleFavorites(String mealId){
  final exixtingIndex = _favouriteMeals.indexWhere((meal) => meal.id == mealId);

  if (exixtingIndex >= 0){
    setState((){
      _favouriteMeals.removeAt(exixtingIndex);
    });
  }
  else{
    setState((){
      _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    });
  }

}

bool _isMealFavorite(String id){
  return _favouriteMeals.any((meal) => meal.id == id);
}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.blueAccent,
        canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 18,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //home: MyApp(),
      routes: {
        '/' : (Context) => SplashScreen(),
        CategoryMealScreen.routeName : (context) => CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName : (context) => MealDetailScreen(_toggleFavorites,_isMealFavorite),
        FiltersScreen.routeName : (context) => FiltersScreen(_filters,_setFilters),
        TabsScreen.routeName : (context) => TabsScreen(_favouriteMeals),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Meal App'),
      ),
      body: null,
    );
  }
}
