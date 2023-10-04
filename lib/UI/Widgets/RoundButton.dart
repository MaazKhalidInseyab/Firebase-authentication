import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

   RoundButton({required this.title,required this.onTap,this.loading=false});
  final String title;
  final VoidCallback onTap;
  bool loading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
        // width: 100,
         // color: Colors.blue,
          decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(8)),child: Center(child: loading?CircularProgressIndicator(strokeWidth: 3,color: Colors.white,):Text(title,style: TextStyle(color: Colors.white,fontSize: 20),)),),
      ),
    );
  }
}

