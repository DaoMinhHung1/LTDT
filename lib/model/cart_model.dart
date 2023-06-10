import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  final String productId;
  final String productDes;
  final String productImage;
  final int productPrice;
  final int productQuantity;
  final String productName;
  CartModel({
    required this.productDes,
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
  });
  factory CartModel.fromDocument(QueryDocumentSnapshot doc) {
    return CartModel(
      productId: doc["productId"],
      productDes: doc["productDes"],
      productImage: doc["productImage"],
      productName: doc["productName"],
      productPrice: doc["productPrice"],
      productQuantity: doc["productQuantity"],
    );
  }
}
