import 'package:flutter/material.dart';
import 'package:quanlycafe/Widgets/ToppingDetailWidget.dart';

class ToppingWidget extends StatelessWidget {
  final String toppingImage;
  final String toppingName;
  final String toppingPrice;
  final String toppingId;
  final String toppingDes;
  final int toppingQuantity;

  const ToppingWidget({
    Key? key,
    required this.toppingImage,
    required this.toppingName,
    required this.toppingPrice,
    required this.toppingId,
    required this.toppingDes,
    required this.toppingQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Container(
        width: 170,
        height: 225,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 3),
              )
            ]),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ToppingDetail(
                          toppingImage: toppingImage,
                          toppingName: toppingName,
                          toppingId: toppingId,
                          toppingPrice: toppingPrice,
                          toppingDes: toppingDes,
                          toppingQuantity: toppingQuantity,
                        )));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                child: Image.network(
                  toppingImage,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                toppingName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    toppingPrice,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 26,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
