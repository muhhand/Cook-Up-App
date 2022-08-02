import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meal_app/screens/tabs_screen.dart';

class Splash3Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text('Loading',style: TextStyle(fontSize: 40,color: Colors.white),),
        centerTitle: true,
      ),
      body: AnimatedSplashScreen(
        backgroundColor: Colors.greenAccent,
        duration: 4000,
        splash: Container(
          width: 600,
          height: 800,
          child: Lottie.network('https://assets4.lottiefiles.com/private_files/lf30_6yjihjym.json',fit: BoxFit.cover,),
        ),
        nextRoute: TabsScreen.routeName,
      ),
    );
  }
}
