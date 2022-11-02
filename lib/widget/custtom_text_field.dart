import 'package:flutter/material.dart';
import 'package:mychatapp/screen/registration_screen.dart';

class Custtom_Text_Field extends StatelessWidget {
  Custtom_Text_Field({this.hinttext, this.controller});
  String? hinttext;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
//     TextEditingController emileController = TextEditingController();
// TextEditingController passwordController = TextEditingController();
    return TextFormField(
      validator: (data) {
        if (data!.toString().isEmpty) {
          return "This field is required";
        }
        ;
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
