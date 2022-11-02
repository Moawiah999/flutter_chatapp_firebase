import 'package:flutter/material.dart';

class Custom_Boutton extends StatelessWidget {
   Custom_Boutton({required this.text,required this.ontap});
  String text;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap ,
      child: Container(
        
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
