import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../modules/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'category_meals';

  final List<Meal> availabelMeals;

  CategoryMealScreen( this.availabelMeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    final routArg = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryId = routArg['id'];
    categoryTitle = routArg['title'];
    displayedMeals = widget.availabelMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }




  void _removeMeal(String mealId){
    setState((){
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
      iconTheme: IconThemeData(
      color: Colors.white
      ),
      title: Text(categoryTitle != null?categoryTitle:'',style: TextStyle(color: Colors.white),),),
      body: ListView.builder(
          itemBuilder: (ctx,index){
            return MealItem(
              id: displayedMeals[index].id,
              imageUrl: displayedMeals[index].imageUrl,
              title: displayedMeals[index].title,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
            );
          },
          itemCount: displayedMeals.length,
      ),
    );
  }
}
