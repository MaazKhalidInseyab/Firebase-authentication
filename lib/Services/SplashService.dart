import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_rtdb2/UI/Auth/LoginScreen.dart';

class SplashService{
  void isUserLoggedIn(BuildContext context){
Timer(Duration(seconds: 3), () {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),));
});

  }
}