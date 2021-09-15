import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:e_commerce/widgets/change_theme_button_widget.dart';

class Setting_Screen extends StatefulWidget {
  const Setting_Screen({Key key}) : super(key: key);

  @override
  _Setting_ScreenState createState() => _Setting_ScreenState();
}

class _Setting_ScreenState extends State<Setting_Screen> {
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
          title: Text("Settings", style: TextStyle(color: Theme.of(context).primaryColor,fontFamily: 'FredokaOne')),
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
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 27),
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.dark_mode_rounded),
                Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 20.0,
                      fontFamily: 'FredokaOne'
                  ),
                ),
                ChangeThemeButtonWidget(),
              ],
            ),
            Divider(
              height: 20.0,
              color: Colors.grey.shade800,
            ),
          ]),
        ),
      ),
    );
  }
}
