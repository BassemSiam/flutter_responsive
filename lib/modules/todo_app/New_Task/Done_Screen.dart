import 'package:flutter/material.dart';

class DonedScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(
      "Done" ,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
      ),
    ));
  }
}