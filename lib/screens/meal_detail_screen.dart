import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  static const routeName = 'meal_detail';
  final Function toggleFavorites;
  final Function isFavorites;

  MealDetailScreen( this.toggleFavorites, this.isFavorites);



  Widget buildSectionTitle(BuildContext context, String text) {
    Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child:Text(text,style: Theme.of(context).textTheme.titleLarge,),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.lightBlue),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: 300,
      height: 400,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text(selectedMeal.title,style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child:Text("Ingredients",style: Theme.of(context).textTheme.titleLarge,),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.lightBlue),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: 300,
              height: 150,
              child: ListView.builder(
                itemBuilder: (ctx,index) => Card(
                  color: Colors.lightBlue.shade200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child:Text("Steps",style: Theme.of(context).textTheme.titleLarge,),
            ),
            buildContainer(
              ListView.builder(
              itemBuilder: (ctx,index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("${index+1}"),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> toggleFavorites(mealId),
        child: Icon(
            isFavorites(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
