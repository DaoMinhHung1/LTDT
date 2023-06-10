import 'package:flutter/material.dart';
import 'package:quanlycafe/ForgotPassword/forgot_page.dart';
import 'package:quanlycafe/route/routing_page.dart';

class CenterPart extends StatelessWidget {
  final TextEditingController? email;
  final bool obscureText;
  final TextEditingController? password;
  final Widget icon;
  final void Function()? onPressed;

  CenterPart({
    required this.obscureText,
    required this.icon,
    required this.email,
    required this.password,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]!.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600]!.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    obscureText: obscureText,
                    controller: password,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: onPressed,
                        icon: icon,
                      ),
                    ),
                  ),
                ),
              ),
              buildForgotPasswordWidget(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildForgotPasswordWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RoutingPage.goTonext(
          context: context,
          navigateTo: ForgotPassword(),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.centerRight,
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
