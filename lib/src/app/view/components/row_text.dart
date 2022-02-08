import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  final String? text01, text02;
  RowText(this.text01, this.text02) {}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              text01!,
              style: TextStyle(
                color: Colors.brown,
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text02!,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
