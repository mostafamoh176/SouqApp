import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String name;
  MyButton({this.name, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 2), blurRadius:1.0)
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: [
            Color(0xff746bc9),
            Colors.deepPurple.shade100,
          ],
        ),
        color: Color(0xff746bc9),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          name,
          style: TextStyle(color: Colors.white,fontFamily: 'FredokaOne',fontSize: 20),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 60)),
          backgroundColor:
          MaterialStateProperty.all(Colors.transparent),
          // elevation: MaterialStateProperty.all(3),
          shadowColor:
          MaterialStateProperty.all(Colors.transparent),
        ),

        // color: Color(0xff746bc9),
        onPressed: onPressed,
      ),
    );
  }
}
