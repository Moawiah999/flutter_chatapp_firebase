import 'package:flutter/material.dart';
import 'package:mychatapp/constant/constant.dart';
import 'package:mychatapp/screen/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widget/custom_boutton.dart';
import '../widget/custtom_text_field.dart';
import 'package:firebase_core/firebase_core.dart';

class Login_Screen extends StatelessWidget {
  Login_Screen({super.key});
  static String id = "Registrationscreen";
  GlobalKey<FormState> myform = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: myform,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Center(
                  child: Text(
                    "chat app ",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      "LOGIN ",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Custtom_Text_Field(
                  hinttext: "Emile",
                ),
                SizedBox(
                  height: 10,
                ),
                Custtom_Text_Field(
                  hinttext: "password",
                ),
                SizedBox(
                  height: 30,
                ),
                Custom_Boutton(
                  ontap: () async {
                    if (myform.currentState!.validate()) {
                      try {
                        UserCredential myuser = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                      } catch (e) {}
                    }
                  },
                  text: "login",
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You don't have an account",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Registration_Screen.id);
                      },
                      child: Text(
                        "registration",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
