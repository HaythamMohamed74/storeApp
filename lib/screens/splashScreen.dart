import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/screens/homePage.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animationController.repeat();
    Future.delayed(Duration(seconds: 5)).then((_) {
      Navigator.pushReplacementNamed(context, Home.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Text(' Store App',style: TextStyle(fontSize: 40,color: Colors.red,fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
