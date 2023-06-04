import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToppingDetail extends StatelessWidget {
  final String toppingImage;
  final String toppingName;
  final String toppingPrice;
  final String toppingDes;

  const ToppingDetail({
    Key? key,
    required this.toppingImage,
    required this.toppingName,
    required this.toppingPrice,
    required this.toppingDes,
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
                    toppingImage,
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
                        toppingName,
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 3,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Image.network(
                      //   productImage,
                      //   style: TextStyle(
                      //     fontSize: 30,
                      //     letterSpacing: 1,
                      //     color: Colors.black,
                      //   ),
                      // ),
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
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Icon(
                                    CupertinoIcons.add,
                                    size: 18,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              toppingPrice,
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
                        toppingDes,
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
                          SizedBox(height: 20),
                          Text(
                            "60ml",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
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
                                color: Color.fromARGB(255, 8, 28, 38),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text(
                                "Add to cart ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
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
                                )),
                          ],
                        ),
                      )
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
