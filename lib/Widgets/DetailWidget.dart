import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quanlycafe/Pages/CartPages/CartPage.dart';
import 'package:quanlycafe/Widgets/my_button.dart';
import 'package:quanlycafe/route/routing_page.dart';

class DetailItemScreen extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final String productDes;
  final String productId;
  final int productQuantity;

  const DetailItemScreen({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productDes,
    required this.productId,
    required this.productQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Image.network(
                    productImage,
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          letterSpacing: 3,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(height: 25),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
//handle decrease quantity function
                                    },
                                    child: Icon(
                                      CupertinoIcons.minus,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    productQuantity.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  GestureDetector(
                                    onTap: () {
//handle increase quantity function
                                    },
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              productPrice.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        productDes,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Volume: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10), // fixed layout issue
                          Text(
                            "60ml",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 50),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 50, 54, 56),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: MyButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("cart")
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .collection("userCart")
                                      .doc(productId)
                                      .set(
                                    {
                                      "productId": productId,
                                      "productName": productName,
                                      "productImage": productImage,
                                      "productPrice": productPrice,
                                      "productDes": productDes,
                                      "productQuantity": productQuantity,
                                    },
                                  );
                                  RoutingPage.goTonext(
                                    context: context,
                                    navigateTo: CartPage(),
                                  );
                                },
                                text: 'Add to cart',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Color(0xFFE57734),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
