import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Land extends StatelessWidget {
  const Land({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50.0, 0, 0, 0),
      child: Image.asset(
        "assets/images/flower.png",
        height: getProportionateScreenWidth(330),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
