import 'package:e_commerce/provider/product_provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutSingleProduct extends StatefulWidget {
  final String name;
  final String image;
  final int index;
  final String color;
  final String size;
  final quantity;
  final double price;

  CheckOutSingleProduct({
    this.index,
    this.color,
    this.size,
    this.quantity,
    this.image,
    this.name,
    this.price,
  });

  @override
  _CheckOutSingleProductState createState() => _CheckOutSingleProductState();
}

TextStyle myStyle = TextStyle(fontSize: 18, fontFamily: 'FredokaOne');
ProductProvider productProvider;

class _CheckOutSingleProductState extends State<CheckOutSingleProduct> {
  double height, width;

  Widget _buildImage() {
    return Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      height: height * 0.1 + 50,
      width: width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.image),
        ),
      ),
    );
  }

  Widget _buildNameAndClosePart() {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: TextStyle(fontSize: 18, fontFamily: 'FredokaOne'),
          ),
          // IconButton(
          //
          //   icon: Icon(Icons.close),
          //   onPressed: () {
          //     productProvider.deleteCheckoutProduct(widget.index);
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildColorAndSizePart() {
    return Container(
      width: width * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.color,
            style: TextStyle(fontSize: 18, fontFamily: 'FredokaOne'),
          ),
          Text(
            widget.size,
            style: TextStyle(fontSize: 18, fontFamily: 'FredokaOne'),
          )
        ],
      ),
    );
  }

  Widget _buildCountOrNot() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xff9b96d6).withOpacity(0.6),
      ),
      height: 35,
      width: width * 0.2 + 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Quantity",
              style: TextStyle(color: Colors.black, fontFamily: 'FredokaOne'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              widget.quantity.toString(),
              style: TextStyle(
                  fontSize: 18, color: Colors.black, fontFamily: 'FredokaOne'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      width: double.infinity,
      child: Card(
        color: Colors.white54.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                _buildImage(),
                Container(
                  height: height * 0.1 + 50,
                  width: width * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildNameAndClosePart(),
                      _buildColorAndSizePart(),
                      Text(
                        "\$${widget.price.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'FredokaOne'),
                      ),
                      _buildCountOrNot(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
