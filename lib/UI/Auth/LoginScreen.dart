import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_rtdb2/UI/Widgets/RoundButton.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  FirebaseAuth authenticate = FirebaseAuth.instance;
  final dio = Dio();
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var base64Image;
  late final response;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    // getImage();
  }

  // getImage() async {
  //   response = await dio.request('http://110.93.228.3:8085/ords/htafinance/mobile.app.api.v1/profile_image?employee_id=HTA-186&org_id=2',
  //       options: Options(method: 'GET', responseType: ResponseType.bytes));
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.memory(base64Decode(base64Encode(getImage()))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          hintText: "Enter yousername",
                          border: UnderlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please fill this field";
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: "Enter Password",
                          border: UnderlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please fill this field";
                        }
                      }),
                ),
                RoundButton(
                  loading: loading,
                  title: "Log in",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      authenticate
                          .createUserWithEmailAndPassword(
                              email: usernameController.text.toString(),
                              password: passwordController.text.toString())
                          .then((value) {
                        setState(() {
                          loading = false;
                        });
                        Fluttertoast.showToast(msg:"Your account has been created");
                      }).onError((error, stackTrace) {
                        Fluttertoast.showToast(msg: error.toString());
                        setState(() {
                          loading = false;
                        });
                      });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
