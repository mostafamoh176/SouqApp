import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/cartmodel.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/screens/homepage.dart';
import 'package:e_commerce/widgets/checkout_singleproduct.dart';
import 'package:e_commerce/widgets/mybutton.dart';
import 'package:e_commerce/widgets/notification_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  TextStyle myStyle = TextStyle(
    fontSize: 18,
    fontFamily: 'FredokaOne',
  );
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProductProvider productProvider;

  Widget _buildBottomSingleDetail({String startName, String endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          startName,
          style: myStyle,
        ),
        Text(
          endName,
          style: myStyle,
        ),
      ],
    );
  }

  User user;
  double total;
  List<CartModel> myList;

  Widget _buildButton() {
    return Stack(
        children: productProvider.checkOutModelList.map((c) {
      return Container(
        height: 50,
        child: MyButton(
          name: "Buy",
          onPressed: () {
            if (productProvider.getCheckOutModelList.isNotEmpty) {
              FirebaseFirestore.instance.collection("Order").add({
                "ProductName": c.name,
                "ProductPrice": c.price,
                "ProductQuetity": c.quentity,
                "ProductImage": c.image,
                "ProductColor": c.color,
                "ProductSize": c.size,
                "UserId": user.uid,
              });
              setState(() {
                myList.clear();
              });

              productProvider.addNotification("Notification");
            } else {
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text("No Items Yet"),
                ),
              );
            }
          },
        ),
      );
    }).toList());
  }

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    myList = productProvider.checkOutModelList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = FirebaseAuth.instance.currentUser;
    double subTotal = 0;
    double discount = 3;
    double discountRupees;
    double shipping = 60;

    productProvider = Provider.of<ProductProvider>(context);
    productProvider.getCheckOutModelList.forEach((element) {
      subTotal += element.price * element.quentity;
    });

    discountRupees = discount / 100 * subTotal;
    total = subTotal + shipping - discountRupees;
    if (productProvider.checkOutModelList.isEmpty) {
      total = 0.0;
      discount = 0.0;
      shipping = 0.0;
    }

    return WillPopScope(
      onWillPop: () async {
        return Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => HomePage(),
          ),
        );
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Checkout",
              style: TextStyle( color: Theme.of(context).primaryColor, fontFamily: 'FredokaOne')),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color:Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => HomePage(),
                ),
              );
            },
          ),
          actions: <Widget>[
            NotificationButton(),
          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          width: 100,
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.only(bottom: 15),
          child: _buildButton(),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: (myList.isEmpty)
                    ? Center(
                        child: Column(
                          children: [
                            Container(
                              height: 300,
                              child: SvgPicture.asset(
                                  'images/empty_checkout_list.svg'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'No Items Added To Cart',
                                style: GoogleFonts.ubuntu(
                                  textStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20.0,
                                      ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(
                        child: ListView.builder(
                          itemCount: myList.length,
                          itemBuilder: (ctx, myIndex) {
                            return Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actions: <Widget>[
                                IconSlideAction(
                                  caption: 'Delete',
                                  color: Colors.red,
                                  icon: Icons.delete,
                                  onTap: () => productProvider
                                      .deleteCheckoutProduct(myIndex),
                                ),
                              ],
                              child: CheckOutSingleProduct(
                                index: myIndex,
                                color: myList[myIndex].color,
                                size: myList[myIndex].size,
                                image: myList[myIndex].image,
                                name: myList[myIndex].name,
                                price: myList[myIndex].price,
                                quantity: myList[myIndex].quentity,
                              ),
                            );
                          },
                        ),
                      ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildBottomSingleDetail(
                        startName: "Subtotal",
                        endName: "\$ ${subTotal.toStringAsFixed(2)}",
                      ),
                      _buildBottomSingleDetail(
                        startName: "Discount",
                        endName: "${discount.toStringAsFixed(2)}%",
                      ),
                      _buildBottomSingleDetail(
                        startName: "Shipping",
                        endName: "\$ ${shipping.toStringAsFixed(2)}",
                      ),
                      _buildBottomSingleDetail(
                        startName: "Total",
                        endName: "\$ ${total.toStringAsFixed(2)}",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
