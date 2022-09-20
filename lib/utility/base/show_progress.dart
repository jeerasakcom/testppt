import 'package:flutter/material.dart';
import 'package:modprinting/utility/base/show_text.dart';



class ShowProgress extends StatelessWidget {
  const ShowProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          color: Colors.white,
        ),
        SizedBox(height: 36,),
        ShowTextNew(label: 'Loading ... Please wait')
      ],
    ));
  }
}
