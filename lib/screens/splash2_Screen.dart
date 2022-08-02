import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meal_app/main.dart';
import 'package:meal_app/screens/splash3_Screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

class Splash2Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text('Loading',style: TextStyle(fontSize: 40,color: Colors.white),),
        centerTitle: true,
      ),
      body: AnimatedSplashScreen(

        backgroundColor: Colors.lightBlue,
        duration: 4000,
        splash: Container(
          width: 600,
          height: 800,
          child: Lottie.network('https://assets4.lottiefiles.com/packages/lf20_q5evpnci.json',fit: BoxFit.cover,),
        ),
          nextScreen: Splash3Screen(),
      ),
    );
  }
}
