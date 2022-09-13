import 'package:flutter/material.dart';
import 'package:modprinting/utility/stylepro.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialPage extends StatefulWidget {
  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff004080),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg105.jpg"),
            fit: BoxFit.cover,
          ),
        ),



        child: Container(
          //color: StyleProjects().darkColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 120),
                  Text(
                    "Social Network",
                    textAlign: TextAlign.center,
                    style: StyleProjects().TopicMain1,
                  ),
                  SizedBox(height: 20),

                  SizedBox(
                    child: Image.asset(
                      'assets/images/tdvpprinting20.png',
                    ),
                  ),


                  //
                  SizedBox(height: 20),
                  FacebookSignInButton(onPressed: () => launch('https://www.facebook.com/โรงพิมพ์อาสารักษาดินแดน-กรมการปกครอง-113003706735920/'),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
