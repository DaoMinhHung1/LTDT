import 'package:flutter/material.dart';
import 'package:duan1/Widgets/AppBarWidget.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 5),
        child: ListView(
          children: [
          AppBarWidget(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset(
              "images/trasua1.png",
              height: 300,
            ),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 60,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 18,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.red,
                            ),
                            onRatingUpdate: (index) {},
                          ),
                       Text(
                        "\$10",
                        style: TextStyle(),
                       ),
                      ],
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(top: 10, bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hot Trend",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 90,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              CupertionIcons.minus,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                                ),
                            ),
                            Icon(
                              CupertionIcons.plus,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                  ),
                  child: Text(
                    "Tessjdnfjfnjfgnfgggggggggggggggggdiiiiiiii",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                  ),
                  child: Text(
                    "lllllllll",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify,
                  ),
                  ),
                ],
              ),
            )
          )
          ),
          ],
        ),
      ),
    );
  }
}
