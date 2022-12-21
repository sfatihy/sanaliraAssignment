import 'package:flutter/material.dart';

class TextFormFieldContainer extends StatelessWidget {
  final Widget widget;

  const TextFormFieldContainer({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 1
        )
      ),
      child: widget
    );
  }
}
