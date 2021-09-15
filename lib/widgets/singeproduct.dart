import 'package:flutter/material.dart';

class SingleProduct extends StatefulWidget {
  final String image;
  final double price;
  final String name;
  const SingleProduct({Key key,this.image, this.name, this.price}) : super(key: key);

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {

  @override
  Widget build(BuildContext context) {

    double width, height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Card(
      child: Container(
        height: height * 0.3,
        width: width * 0.2 * 2 + 10,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.image),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "\$ ${widget.price.toString()}",
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xff9b96d6),
                        fontFamily: 'FredokaOne'
                    ),
                  ),
                  Container(
                    child: Text(
                      widget.name,
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


















