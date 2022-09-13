import 'package:flutter/material.dart';
import 'package:modprinting/components/guest/homescreen/homescreen.dart';
import 'package:modprinting/components/guest/contactpage/locationpage.dart';
import 'package:modprinting/components/guest/contactpage/socialscreen.dart';
import 'package:modprinting/utility/stylepro.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff004080),
            /*
            actions: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],

             */
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                      Color(0xff002040),
                      Color(0xff004080),
                    ]),
                  ),
                  child: Container(
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 75,
                          ),
                        ),
                        Text(
                          'โรงพิมพ์อาสารักษาดินแดน กรมการปกครอง\n'
                          'Territorial Defence Volunteers Printing',
                          textAlign: TextAlign.center,
                          style: StyleProjects().TopicMainT3_C,
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  //onTap: () => Navigator.of(context).pop(),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePageDesign())),
                ),
                ListTile(
                  leading: Icon(Icons.phone_in_talk),
                  title: Text('Phone Number'),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactScreen())),
                ),
                ListTile(
                  leading: Icon(Icons.supervisor_account),
                  title: Text('Social Network'),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context)=> SocialPage() )),
                ),
                ListTile(
                  leading: Icon(Icons.person_pin),
                  title: Text('Maps'),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context)=> MapsPage() )),
                ),
              ],
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            constraints: BoxConstraints.expand(),

            /*
            decoration: BoxDecoration(
              //color: const Color(0xfff4f8fb),
              color: const Color(0xffd6f0ff),
            ),

            */

            /*
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg105.jpg"),
                fit: BoxFit.cover,
              ),
            ),

            */

            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 20,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "ติดต่อ/สอบถาม",
                          textAlign: TextAlign.center,
                          style: StyleProjects().TopicMainT3_A,
                        ),

                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      //
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          //color: const Color(0xfff4f8fb),
                          color: const Color(0xffd6f0ff),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Material(
                              child: Container(
                                decoration: BoxDecoration(
                                  //color: const Color(0xfff4f8fb),
                                  color: const Color(0xffd6f0ff),
                                ),
                                child: IconButton(
                                  icon:
                                      Image.asset('assets/images/contact.png'),
                                  onPressed: () => launch("tel://020124170"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'ศูนย์บริการลูกค้า (ส่วนกลาง)',
                                  textAlign: TextAlign.center,
                                  style: StyleProjects().TopicMainT3,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  '0-2012-4170  ถึง  80',
                                  textAlign: TextAlign.center,
                                  style: StyleProjects().TopicMainT3,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          //color: const Color(0xfff4f8fb),
                          color: const Color(0xffd6f0ff), //99daff),  //00a4ff),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        //padding: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Material(
                              child: Container(
                                decoration: BoxDecoration(
                                  //color: const Color(0xfff4f8fb),
                                  color: const Color(0xffd6f0ff),
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/contact.png',
                                  ),
                                  onPressed: () => launch("tel://0863253414"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'งานจำหน่าย',
                                  textAlign: TextAlign.center,
                                  style: StyleProjects().TopicMainT3,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "086-3253414",
                                  textAlign: TextAlign.center,
                                  style: StyleProjects().TopicMainT3,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          //color: const Color(0xfff4f8fb),
                          color: const Color(0xffd6f0ff),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Material(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffd6f0ff),
                                  //color: const Color(0xfff4f8fb),
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/contact.png',
                                  ),
                                  onPressed: () => launch("tel://0863253416"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'งานรับงานและประเมินราคา',
                                  textAlign: TextAlign.center,
                                  style: StyleProjects().TopicMainT3,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "086-3253416",
                                  textAlign: TextAlign.center,
                                  style: StyleProjects().TopicMainT3,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          //color: const Color(0xfff4f8fb),
                          color: const Color(0xffd6f0ff),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Material(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffd6f0ff),

                                  //color: const Color(0xfff4f8fb),
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/contact.png',
                                  ),
                                  onPressed: () => launch("tel://0863253413"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'งานเร่งรัดและติดตามหนี้สิน',
                                  textAlign: TextAlign.center,
                                  style: StyleProjects().TopicMainT3,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "086-3253413",
                                  textAlign: TextAlign.center,
                                  style: StyleProjects().TopicMainT3,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffd6f0ff),
                          //color: const Color(0xfff4f8fb),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Material(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffd6f0ff),
                                  //color: const Color(0xfff4f8fb),
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/contact.png',
                                  ),
                                  onPressed: () => launch("tel://0863253417"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'งานการเงิน',
                                  textAlign: TextAlign.center,
                                  style: StyleProjects().TopicMainT3,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "086-3253417",
                                  textAlign: TextAlign.center,
                                  style: StyleProjects().TopicMainT3,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
