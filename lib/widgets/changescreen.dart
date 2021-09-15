import 'package:flutter/material.dart';

class ChangeScreen extends StatelessWidget {
  final String whichAccount;
  final Function onTap;
  final String name;

  ChangeScreen({this.name, this.onTap, this.whichAccount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          whichAccount,
          style: TextStyle(fontSize: 16, fontFamily: 'FredokaOne'),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            name,
            style: TextStyle(
                color: Color(0xffBFA2DB),
                fontSize: 20,
                fontFamily: 'FredokaOne'
            ),
          ),
        ),
      ],
    );
  }
}
