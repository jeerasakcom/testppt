import 'dart:async';
import 'dart:io';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:modprinting/components/guest/Authentication/authentication.dart';
import 'package:modprinting/components/guest/assessment/assessmentpage.dart';
import 'package:modprinting/components/guest/calendarpage/calendarpage.dart';

import 'package:modprinting/components/guest/catalogpage/catalogpage.dart';
import 'package:modprinting/components/guest/chatscreen/chatscreen.dart';
import 'package:modprinting/components/guest/contactpage/contactpage.dart';
import 'package:modprinting/components/guest/datacorporation/datacorporation.dart';
import 'package:modprinting/components/guest/evaluatepage/evaluatepage.dart';
import 'package:modprinting/components/guest/infopage/infoscreen.dart';
import 'package:modprinting/components/guest/printqueuepage/printqueue.dart';
import 'package:modprinting/components/guest/trackingpage/trackingpage.dart';
import 'package:modprinting/utility/stylepro.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class HomePageDesign extends StatefulWidget {
  const HomePageDesign({Key? key}) : super(key: key);

  @override
  State<HomePageDesign> createState() => _HomePageDesignState();
}

class _HomePageDesignState extends State<HomePageDesign> {
  Future<bool> _onWillPop() async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              //backgroundColor: Color.fromARGB(255, 0, 149, 255),
              //backgroundColor: Color(0xffe8e2d4),
              backgroundColor: Color(0xffe2d4e8),
              title: Text(
                'Exit',
                style: StyleProjects().TopicMain1_A,
              ),
              content: Text(
                'คุณต้องการออกจากแอปพลิเคชัน?',
                //style: StyleProjects().TopicMain2,
                style: StyleProjects().TopicMainT3_B,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                    child: Text(
                      'ใช่',
                      style: StyleProjects().TopicMainT3_B,
                      //style: StyleProjects().TopicMainT3_1,
                    )),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(
                      'ไม่',
                      style: StyleProjects().TopicMainT3_B,
                    ))
              ],
            ));
  }

  List<String> nameIcons = [
    '001.png',
    '002.png',
    '003.png',
    '004.png',
    '005.png',
    '006.png',
    '007.png',
    '008.png',
    '009.png',
  ];

  List<String> titles = [
    'ข้อมูลองค์กร',
    'แบบสิ่งพิมพ์',
    'ประเมินราคา',
    'ปฏิทิน',
    'สถานะการพิมพ์',
    'การจัดส่ง',
    'ติดต่อ',
    'ข่าวสาร',
    'แชทบอท',
  ];

  List<Widget> widgets = [];

  List<Widget> routToWidgdets = [
    DataCorporateScreen(),
    CatalogPage(),
    AssessmentPage(),
    //EvaluatePage(),
    CalendarPage(),
    PrintQueuePage(),
    TrackingPage(),
    ContactScreen(),
    InfotdvpScreen(),
    ChatbotPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    int i = 0;
    for (var title in titles) {
      Widget widget = createECard(title, nameIcons[i], i);
      widgets.add(widget);
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget imageSliderCarousel = Container(
      color: Color.fromARGB(239, 0, 13, 112),
      height: 200,
      child: Carousel(
        //
        autoplay: true,
        //boxFit: BoxFit.fitWidth,
        boxFit: BoxFit.fill,
        dotBgColor: Colors.transparent,
        dotSize: 3,
        dotColor: Color.fromARGB(255, 0, 0, 0),
        dotIncreasedColor: Color.fromARGB(255, 23, 23, 23),
        autoplayDuration: Duration(seconds: 35),
        animationCurve: Curves.fastOutSlowIn,

        images: [
          AssetImage('assets/images/oc102.png'),
          AssetImage('assets/images/oc103.png'),
          AssetImage('assets/images/oc104.png'),
          AssetImage('assets/images/oc105.jpg'),
          AssetImage('assets/images/oc101.png'),
        ],
      ),
    );

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff81d4fa),
          title: Text(
            'โรงพิมพ์อาสารักษาดินแดน กรมการปกครอง\n'
            'Territorial Defence Volunteers Printing',
            style: StyleProjects().TopicMain5,
          ),
          actions: [
            // action button
            IconButton(
              icon: SvgPicture.asset(
                "assets/images/account_circle.svg",
                height: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthenticationPage(),
                  ),
                );
              },
            ),
          ],
          leading: IconButton(
            icon: Image.asset('assets/images/logo.png'),
            onPressed: () {},
          ),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              imageSliderCarousel,
              StyleProjects().boxSpace1,

              HeaderPage(),

              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.all(10.0),
                  //padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  primary: false,
                  crossAxisCount: 3,
                  children: widgets,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createECard(String title, String nameIcon, int index) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => routToWidgdets[index],
        ),
      ),

      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //color: const Color(0xff003a9f),
        color: const Color(0xffb3e5fc),

        //color: StyleProjects().mainbutton,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/images/$nameIcon',
                  width: 50,
                  height: 50,
                ),
              ),
              Text(
                title,
                style: StyleProjects().TopicMain3,
              ),
            ],
          ),
        ),
      ),

      //
    );
  }

  Widget HeaderPage() {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                  //color: const Color(0xffffda7a),
                  //color: const Color(0xff000f3b),
                  color: const Color(0xFF14005C),
                ),
              ),
            ),
            Text(
              "เมนู",
              textAlign: TextAlign.center,
              //style: StyleProjects().TopicMain7,
              style: StyleProjects().TopicMain1,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                  //color: const Color(0xffffda7a),
                  // color: const Color(0xff000f3b),
                  color: const Color(0xFF14005C),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //
}
