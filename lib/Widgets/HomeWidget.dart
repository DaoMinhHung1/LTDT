import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quanlycafe/Widgets/ProductWidget.dart';
import 'package:quanlycafe/Widgets/ToppingWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30, bottom: 20),
          child: ListView(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
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
                  ],
                ),
              ),
              SizedBox(height: 30),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Trà sữa Hot & Cold",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 50, 54, 56),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Find your Coffe",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white.withOpacity(0.5),
                      )),
                ),
              ),
              TabBar(
                  controller: _tabController,
                  labelColor: Color(0xFFE57734),
                  unselectedLabelColor: Colors.black.withOpacity(0.5),
                  isScrollable: true,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 3,
                      color: Color(0xFFE57734),
                    ),
                  ),
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(text: "Menu"),
                    Tab(text: "Topping"),
                    // Tab(text: "Sale"),
                  ]),
              SizedBox(height: 10),
              Center(
                child: [
                  //Menu
                  Container(
                    height: 220,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection("product")
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> streamSnapshort) {
                              if (!streamSnapshort.hasData) {
                                return Center(
                                    child: const CircularProgressIndicator());
                              }
                              return Row(
                                children: streamSnapshort.data!.docs.map((doc) {
                                  return ProductWidget(
                                    productId: doc["productId"],
                                    productName: doc["productName"],
                                    productImage: doc["productImage"],
                                    productPrice: doc["productPrice"],
                                    productDes: doc["productDes"],
                                    productQuantity: doc["productQuantity"],
                                  );
                                }).toList(),
                              );
                            })),
                  ),
                  //Topping
                  Container(
                    height: 220,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("topping")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot> streamSnapshort) {
                          if (!streamSnapshort.hasData) {
                            return Center(
                                child: const CircularProgressIndicator());
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: streamSnapshort.data!.docs.length,
                            itemBuilder: (ctx, index) {
                              return ToppingWidget(
                                toppingName: streamSnapshort.data!.docs[index]
                                    ["toppingName"],
                                toppingId: streamSnapshort.data!.docs[index]
                                    ["toppingId"],
                                toppingImage: streamSnapshort.data!.docs[index]
                                    ["toppingImage"],
                                toppingPrice: streamSnapshort.data!.docs[index]
                                    ["toppingPrice"],
                                toppingDes: streamSnapshort.data!.docs[index]
                                    ["toppingDes"],
                                toppingQuantity: streamSnapshort
                                    .data!.docs[index]["toppingQuantity"],
                              );
                            },
                          );
                        }),
                  ),
                  //sale
                  // Container(
                  //   height: 220,
                  //   child: SingleChildScrollView(
                  //       scrollDirection: Axis.horizontal,
                  //       physics: BouncingScrollPhysics(),
                  //       child: StreamBuilder(
                  //           stream: FirebaseFirestore.instance
                  //               .collection("sale")
                  //               .snapshots(),
                  //           builder: (context,
                  //               AsyncSnapshot<QuerySnapshot> streamSnapshort) {
                  //             if (!streamSnapshort.hasData) {
                  //               return Center(
                  //                   child: const CircularProgressIndicator());
                  //             }
                  //             return Row(
                  //               children: streamSnapshort.data!.docs.map((doc) {
                  //                 return SaleWidget(
                  //                   saleName: doc["saleName"],
                  //                   saleImage: doc["saleImage"],
                  //                   salePrice: doc["salePrice"],
                  //                 );
                  //               }).toList(),
                  //             );
                  //           })),
                  // ),
                ][_tabController.index],
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: HomeBottomBar(),
    );
  }
}
