import 'package:app_shop_tra_sua/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'background.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             SizedBox(height: 600,),
              const TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username'
                ),

              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'password',
                  hintText: 'Enter your password',
                  suffixIcon: IconButton(onPressed: () {},
                  icon: const Icon(Icons.visibility),
                  ),
                ),
              ),
            
               ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: TextButton(
                    onPressed: () {
                       Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  HomePage(),
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
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(  "Don’t have an Account ? ",
              
         
        ),
        GestureDetector(
          child: Text("Sign Up",
          style: TextStyle( fontWeight: FontWeight.bold),),
        )
                ],
              ),
          ],
        ),
    );
  }
}
