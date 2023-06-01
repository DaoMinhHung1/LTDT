import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quanlycafe/Widgets/HomeBottom.dart';
import 'package:quanlycafe/Widgets/ItemWidget.dart';
import 'package:quanlycafe/Widgets/ToppingWidget.dart';
import 'package:quanlycafe/Widgets/AppBarWidget.dart';

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

  List<Widget> _widgets = [
    ItemsWidget(),
    ToppingWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: ListView(
            children: [
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       InkWell(
              //         onTap: () {},
              //         child: Icon(
              //           Icons.sort_rounded,
              //           color: Colors.white.withOpacity(0.5),
              //           size: 35,
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () {},
              //         child: Icon(
              //           Icons.notifications,
              //           color: Colors.white.withOpacity(0.5),
              //           size: 35,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Menu Coffee",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Find your Coffe",
                      hintStyle: TextStyle(
                        color: Colors.black45,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.red,
                      )),
                ),
              ),
              TabBar(
                  controller: _tabController,
                  labelColor: Color(0xFFE57734),
                  unselectedLabelColor: Colors.black,
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
              // SizedBox(height: 10),
              // Center(
              //   child: [
              //     ItemsWidget(),
              //     ItemsWidget(),
              //     ItemsWidget(),
              //   ][_tabController.index],
              // ),
              // SizedBox(height: 10),
              // Center(
              //   child: [
              //     ToppingWidget(),
              //     ToppingWidget(),
              //     ToppingWidget(),
              //   ][_tabController.index],
              // )
              Center(child: _widgets[_tabController.index]),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: HomeBottomBar(),
    );
  }
}
