import 'package:app_shop_tra_sua/menu_login_signup/background.dart';
import 'package:app_shop_tra_sua/menu_login_signup/home_login.dart';
import 'package:app_shop_tra_sua/menu_login_signup/home_signup.dart';

import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Spacer(),
          Container(
            width: size.width * 0.8,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: TextButton(
                    onPressed: () {
                       Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginHome(),
                      ),
                      (route) => false);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 251, 218, 88),
                      ),
                    ),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10), // Khoảng cách giữa hai nút
                ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupHome(),
                      ),
                      (route) => false);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 232, 220, 155),
                      ),
                    ),
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
