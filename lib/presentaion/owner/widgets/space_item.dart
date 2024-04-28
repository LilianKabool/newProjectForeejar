import 'package:flutter/cupertino.dart';

class SpaceItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight/50,
    );
  }

}