import 'package:flutter/material.dart';
import 'package:quanlycafe/Widgets/DetailWidget.dart';

class ProductWidget extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final String productDes;
  final String productId;
  final int productQuantity;

  const ProductWidget({
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
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailItemScreen(
                  productImage: productImage,
                  productName: productName,
                  productPrice: productPrice,
                  productDes: productDes,
                  productId: productId,
                  productQuantity: productQuantity,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                child: Image.network(
                  productImage,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                productName,
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
                    productPrice.toString(),
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
