import 'package:eshop2/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class splashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreenView(
      navigateRoute: LogIn(),
      duration: 3000,
      imageSize: 180,
      imageSrc: "images/mainlo.png",
      text: "So0oq E-Shop",
      backgroundColor: Colors.white,
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
    );
  }
}
