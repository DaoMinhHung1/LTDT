import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quanlycafe/Widgets/AppBarWidget.dart';
import 'package:quanlycafe/Widgets/CategoriesWidget.dart';
import 'package:quanlycafe/Widgets/DrawerWidget.dart';
import 'package:quanlycafe/Widgets/NewItemsWidget.dart';
import 'package:quanlycafe/Widgets/ProductWidget.dart';
import 'package:quanlycafe/model/cart_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarWidget(),
        backgroundColor: Color.fromARGB(255, 254, 219, 60), // Đổi màu
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/cafe1.png'), // Đường dẫn đến hình ảnh của bạn ở đây
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              // Tìm kiếm
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.search,
                          color: Colors.red,
                        ),
                        Container(
                          height: 50,
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "What would you like to have?",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Danh mục sản phẩm
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Danh mục sản phẩm",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 100,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("categories")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                          if (!streamSnapshot.hasData) {
                            return Center(
                              child: const CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              return Categories(
                                categoryName: streamSnapshot.data!.docs[index]
                                    ["categoryName"],
                                image: streamSnapshot.data!.docs[index]
                                    ["categoryImage"],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Sản phẩm phổ biến
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sản phẩm phổ biến",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 220,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("product")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                          if (!streamSnapshot.hasData) {
                            return Center(
                              child: const CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              return ProductWidget(
                                productName: streamSnapshot.data!.docs[index]
                                    ["productName"],
                                productImage: streamSnapshot.data!.docs[index]
                                    ["productImage"],
                                productPrice: streamSnapshot.data!.docs[index]
                                    ["productPrice"],
                                productDes: streamSnapshot.data!.docs[index]
                                    ["productDes"],
                                productId: streamSnapshot.data!.docs[index]
                                    ["productId"],
                                productQuantity: streamSnapshot.data!.docs[index]
                                    ["productQuantity"],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Tin tức
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tin tức",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("newitem")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                          if (!streamSnapshot.hasData) {
                            return Center(
                              child: const CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              return NewItemsWidget(
                                newName: streamSnapshot.data!.docs[index]
                                    ["newName"],
                                newImage: streamSnapshot.data!.docs[index]
                                    ["newImage"],
                                newPrice: streamSnapshot.data!.docs[index]
                                    ["newPrice"],
                                newDes: streamSnapshot.data!.docs[index]
                                    ["newDes"],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "cartPage");
          },
          child: Icon(
            CupertinoIcons.cart,
            size: 28,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  List<CartModel> cartList = [];
  List<CartModel> newCartList = [];

  late CartModel cartModel;
  void addToCart({
    required String productImage,
    required String productName,
    required int productPrice,
    required String productId,
    required int productQuantity,
    required String productDes,
  }) {
    cartModel = CartModel(
      productImage: productImage,
      productName: productName,
      productPrice: productPrice,
      productId: productId,
      productQuantity: productQuantity,
      productDes: productDes,
    );
    newCartList.add(cartModel);
    cartList = newCartList;
  }

  get throwCartList {
    return cartList;
  }
}
