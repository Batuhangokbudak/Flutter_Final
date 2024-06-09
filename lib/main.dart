import 'package:final_projesi/Screens/ItemPage.dart';
import 'package:final_projesi/Screens/LoginScreen.dart';
import 'package:final_projesi/Screens/ProfileScreen.dart';
import 'package:final_projesi/Screens/communication.dart';
import 'package:final_projesi/Screens/HomePage.dart';
import 'package:final_projesi/Screens/CartPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', 
      routes: {
        '/login': (context) => LoginScreen(),
        '/Profile': (context) => UserProfileScreen(),
        '/Home': (context) => HomePage(),
        '/cartPage': (context) => CartPage(),
        '/itemsPage': (context) => ItemPage(),
        '/iletisim': (context) => IletisimScreen(),
      },
    );
  }
}