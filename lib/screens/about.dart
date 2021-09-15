import 'package:e_commerce/screens/homepage.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("About", style: TextStyle(color: Colors.black,fontFamily: 'FredokaOne')),
          elevation: 0.0,
          backgroundColor: Color(0xfff8f8f8),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => HomePage()));
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 27),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("images/about.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 280,
                  width: 360,
                  child: Wrap(
                    children: [
                      Text(
                        "E-Commerce App",
                        style: TextStyle(fontSize: 22, color: Colors.grey,fontFamily: 'FredokaOne'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "ITI Front-End And Cross-Platform Mobile Development Track Graduation Project.",
                          style: TextStyle(fontSize: 22, color: Colors.grey,fontFamily: 'FredokaOne'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          "By: Eman , Fatema , Mohamed , Abdullah , Loai , Mostafa",
                          style: TextStyle(fontSize: 22, color: Colors.grey,fontFamily: 'FredokaOne'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
