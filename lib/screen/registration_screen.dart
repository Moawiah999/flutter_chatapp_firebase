import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constant/constant.dart';
import '../widget/custom_boutton.dart';
import '../widget/custtom_text_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Registration_Screen extends StatefulWidget {
  Registration_Screen({super.key});
  static String id = "RegistrationScreen";

  @override
  State<Registration_Screen> createState() => _Registration_ScreenState();
}

class _Registration_ScreenState extends State<Registration_Screen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> Formkey = GlobalKey();

  bool isloding = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloding,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: Formkey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
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
                        "Registration ",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Custtom_Text_Field(
                    controller: emailController,
                    hinttext: "Emile",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Custtom_Text_Field(
                    controller: passwordController,
                    hinttext: "password",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Custom_Boutton(
                    text: "Registration",
                    ontap: () async {
                      isloding = true;
                      setState(() {});
                      if (Formkey.currentState!.validate()) {
                        try {
                          await registrauser(
                              context, "The Registration is done");
                        } catch (e) {
                          showSnackBar(
                              context, "There is an account with this email");
                        }
                      }
                      isloding = false;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You already have an account",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "login",
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
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> registrauser(BuildContext context, String message) async {
    UserCredential myuser = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
