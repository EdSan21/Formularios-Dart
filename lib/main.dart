import 'package:flutter/material.dart';
import 'package:formulariologin/screen/login_screen.dart';
import 'package:formulariologin/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Productos App Demo',
        initialRoute: 'login',
        routes: {
          'login': (__) => LoginScreen(),
          'home': (__) => HomeScreen(),
        },
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: Colors.grey[300]));
  }
}
