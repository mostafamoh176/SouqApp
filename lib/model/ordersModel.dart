import 'package:flutter/material.dart';

class OrdersModel {
  final String productName;
  final String productImage;
  final double productPrice;
  final int productQuetity;
  final String productColor;
  final String productSize;
  OrdersModel({
    @required this.productPrice,
    @required this.productName,
    @required this.productImage,
    @required this.productSize,
    @required this.productColor,
    @required this.productQuetity,
  });
}