import 'package:flutter/material.dart';
import 'package:modprinting/utility/stylepro.dart';

class ShowButton extends StatelessWidget {
  final String label;
  final Function() pressFunc;
  final double? opacity;
  const ShowButton({
    Key? key,
    required this.label,
    required this.pressFunc,
    this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          //primary: StyleProjects.primary.withOpacity(opacity ?? 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed: pressFunc,
        child: Text(label),
      ),
    );
  }
}
