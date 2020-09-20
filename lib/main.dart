import 'package:eticaretapp/secreens/auth/auth_sign_in.dart';
import 'package:flutter/material.dart';

import 'secreens/home_screen.dart';
import 'secreens/product/product_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Bebe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: AuthScreen(),
      // home: ProductScreen();
      home: HomeScreen(),
    );
  }
}
