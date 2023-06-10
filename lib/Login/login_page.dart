import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlycafe/Login/Containers/center_part.dart';
import 'package:quanlycafe/Login/Containers/end_part.dart';
import 'package:quanlycafe/Login/Containers/login_container.dart';
import 'package:quanlycafe/Login/Containers/top_part.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    LoginAuthProvider loginAuthProvider =
        Provider.of<LoginAuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/cafe1.png'), // Đặt đường dẫn tới hình ảnh của bạn ở đây
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // top part/
              TopPart(),
              // center part
              CenterPart(
                email: email,
                password: password,
                obscureText: visible,
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                icon: Icon(
                  visible ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              //end part
              EndPart(
                loading: loginAuthProvider.loading,
                onPressed: () {
                  loginAuthProvider.loginPageVaidation(
                    emailAdress: email,
                    password: password,
                    context: context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
