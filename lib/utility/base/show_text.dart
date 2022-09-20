import 'package:flutter/material.dart';
import 'package:modprinting/utility/stylepro.dart';


class ShowTextNew extends StatelessWidget {
  final String label;
  final TextStyle? textStyle;
   ShowTextNew({
    Key? key,
    required this.label,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: textStyle ?? StyleProjects().TopicMain3,
    );
  }
}




/*

class ShowText extends StatelessWidget {
  final String title;
  final String label;
  final TextStyle? textStyle;
  const ShowText({Key? key, required this.title, required this.label ,this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title, style: textStyle == null ? StyleProjects().TopicMain3: textStyle! ,);

  }
}

*/


