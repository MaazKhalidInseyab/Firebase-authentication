

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_rtdb2/Services/SplashService.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SplashService splashService=SplashService();
    splashService.isUserLoggedIn(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment:MainAxisAlignment.center,children: [Text("Flutter App with FireBase Real-Time Database",style: TextStyle(color:Colors.white,fontSize: 40))],),
      )),
    );
  }
}
