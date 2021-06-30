import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final Function()? onPress;
  const DefaultButton(
    this.text, {
    Key? key,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(16),
        // height: 50,
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            '$text',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
