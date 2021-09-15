import 'package:e_commerce/model/cartmodel.dart';
import 'package:e_commerce/provider/product_provider.dart';
import 'package:e_commerce/widgets/checkout_singleproduct.dart';
import 'package:e_commerce/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key key}) : super(key: key);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  List<CartModel> myList;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ProductProvider productProvider;

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    myList = productProvider.favouriteList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text("Favourites", style: TextStyle(color:Theme.of(context).primaryColor,fontFamily: 'FredokaOne')),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
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
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: (myList.isEmpty)
                ? Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SvgPicture.asset('images/empty_favourite_list.svg'),
                          Text('List Is Still Empty',
                          style:GoogleFonts.ubuntu(
                              textStyle:TextStyle(
                                color: Colors.grey,
                            fontSize: 20.0,
                          )),)
                        ],
                      ),
                    ),

                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
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
                                      onTap: () {
                                        setState(() {
                                          productProvider
                                              .deleteFavouriteProduct(myIndex);
                                        });
                                      }),
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
                    ],
                  )),
      ),
    );
  }
}
