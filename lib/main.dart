import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlycafe/Login/Containers/login_container.dart';
import 'package:quanlycafe/Login/login_page.dart';
import 'package:quanlycafe/Signup/signup_page.dart';
import 'package:quanlycafe/Widgets/HomeWidget.dart';
import 'package:quanlycafe/Signup/Containers/signup_container.dart';
import 'package:quanlycafe/proivder/cart_provider.dart';

import 'Pages/HomePage.dart';
import 'Pages/CartPages/CartPage.dart';
import 'Pages/ItemPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignupAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Food App",
        debugShowCheckedModeBanner: false,
// theme: ThemeData(
// scaffoldBackgroundColor: Colors.black87,
// ),
        routes: {
          '/': (context) => HomePage(),
          'HomeScreen': (context) => HomeScreen(),
          "cartPage": (context) => CartPage(),
          "itemPage": (context) => ItemPage(),
        },
        // home: HomePage(),
      ),
    );
  }
}
