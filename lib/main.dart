import 'package:flutter/material.dart';
import 'package:mychatapp/firebase_options.dart';
import 'package:mychatapp/screen/login_screen.dart';
import 'package:mychatapp/screen/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(routes: {
      "Login Screen": (context) => Login_Screen(),
      Registration_Screen.id: (context) => Registration_Screen(),
    }, initialRoute: "Login Screen"),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Login_Screen();
  }
}
