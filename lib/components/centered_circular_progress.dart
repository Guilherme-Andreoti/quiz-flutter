import 'package:flutter/material.dart';

class CenteredCircularProgress extends StatelessWidget {

  final String label; 
  final double radius; 
  final Color  color; 

  const CenteredCircularProgress({
    Key key,
    this.label = 'Carregando',
    this.radius = 64,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: radius,
              height: radius,
              child: CircularProgressIndicator(),
            ),
            CircularProgressIndicator(),
            Text(
              label ,
              textAlign:  TextAlign.center,
              style: TextStyle(
                color: color,
              )
              ),
          ],
        )
      );
  }
}
