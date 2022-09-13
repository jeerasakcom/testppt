/*



import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modprinting/components/guest/Authentication/authentication.dart';
import 'package:modprinting/components/guest/catalogpage/catalogpage.dart';
import 'package:modprinting/components/guest/chatscreen/chatscreen.dart';
import 'package:modprinting/components/guest/contactpage/contactpage.dart';
import 'package:modprinting/components/guest/datacorporation/datacorporation.dart';
import 'package:modprinting/components/guest/evaluatepage/evaluatepage.dart';
import 'package:modprinting/components/guest/infopage/infoscreen.dart';
import 'package:modprinting/components/guest/printqueuepage/printqueue.dart';
import 'package:modprinting/components/guest/register/registerpages.dart';
import 'package:modprinting/components/guest/trackingpage/trackingpage.dart';
import 'package:modprinting/utility/stylepro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:modprinting/components/guest/calendarpage/calendarpage.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  Future<bool> _onWillPop() async {
    return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              //backgroundColor: Color.fromARGB(255, 0, 149, 255),
              title: Text(
                'Exit',
                style: StyleProjects().TopicMain1,
              ),
              content: Text(
                'คุณต้องการออกจากแอปพลิเคชัน?',
                style: StyleProjects().TopicMain2,
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

  final List<String> images = [
    'http://tdvpprint.com/uploads/banners/banner_HXVY8HPOMYOKYEWZI5WLGCHNH.jpg',
    "http://tdvpprint.com/uploads/banners/banner_AF6N9LHS43AVZKHW39GOJZCV0.jpg",
    'http://tdvpprint.com/uploads/banners/banner_HJ06DQIG3LBWHYAMRWKNCYATH.jpg',
    'http://tdvpprint.com/uploads/banners/banner_AF6N9LHS43AVZKHW39GOJZCV0.jpg',
    'http://tdvpprint.com/uploads/banners/banner_DNOYBWK4NACVYN1VV9G0YPAP6.jpg',
  ];

  final List<String> imgList = [
    'http://tdvpprint.com/uploads/banners/banner_HXVY8HPOMYOKYEWZI5WLGCHNH.jpg',
    "http://tdvpprint.com/uploads/banners/banner_AF6N9LHS43AVZKHW39GOJZCV0.jpg",
    'http://tdvpprint.com/uploads/banners/banner_HJ06DQIG3LBWHYAMRWKNCYATH.jpg',
    'http://tdvpprint.com/uploads/banners/banner_AF6N9LHS43AVZKHW39GOJZCV0.jpg',
    'http://tdvpprint.com/uploads/banners/banner_DNOYBWK4NACVYN1VV9G0YPAP6.jpg',
  ];

  List<String> nameIcons = [
    '001.png',
    '002.png',
    '003.png',
    '004.png',
    '005.png',
  ];

  List<String> titles = [
    'ข้อมูลองค์กร',
    'แบบสิ่งพิมพ์',
    'ประเมินราคา',
    'ปฏิทิน',
    'สถานะการพิมพ์',
    
  ];

  List<Widget> widgets = [];

  List<Widget> routToWidgdets = [
    DataCorporateScreen(),
    CatalogPage(),
    EvaluatePage(),
    CalendarPage(),
    PrintQueuePage(),
    
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
    int _current = 0;
    final CarouselController _controller = CarouselController();

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: Image.network(
                  item,
                  fit: BoxFit.fill,
                ),
              ),
            ))
        .toList();

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: StyleProjects().baseColor,
        ),
        body: Container(
          constraints: BoxConstraints.expand(),

          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.bottomCenter,
                height: 200,
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                child: CarouselSlider(
                  items: imageSliders,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: Duration(seconds: 20),
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 2,
                          //color: const Color(0xff070ab5),
                          color: const Color(0xff04066b),
                        ),
                      ),
                    ),
                    Text(
                      "หมวดหมู่",
                      textAlign: TextAlign.center,
                      style: StyleProjects().TopicMain1,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 2,
                          //color: const Color(0xff070ab5),
                          color: const Color(0xff04066b),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.all(10.0),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  primary: false,
                  crossAxisCount: 3,
                  children: widgets,
                ),
              ),

              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Products")
                        //.orderBy('id', descending: true)
                        .orderBy('id')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Text(
                          'กรุณารอสักครู่นะคะ...',
                          style: StyleProjects().H2style,
                        );
                      }
                      int length = snapshot.data!.docs.length;
                      return ListView.builder(
                          itemCount: length,
                          padding: EdgeInsets.all(10),
                          itemBuilder: (_, int index) {
                            final QueryDocumentSnapshot<Object?>? doc =
                                snapshot.data?.docs[index];
                            return Card(
                              margin: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              //color: Color.fromARGB(255, 179, 232, 250),
                              //color: Color.fromARGB(255, 179, 213, 241),
                              color: Color.fromARGB(255, 253, 253, 253),

                              child: Container(
                                height: 135,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                //padding: EdgeInsets.all(10),

                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.bottomLeft,
                                            child: Image.network(
                                              snapshot.data?.docs
                                                  .elementAt(index)['images'],
                                              fit: BoxFit.fill,
                                              width: 70,
                                              height: 50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'ชื่อ : ',
                                                      style: StyleProjects()
                                                          .TopicMain3U2,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      child: Text(
                                                        snapshot.data?.docs
                                                            .elementAt(
                                                                index)['name'],
                                                        softWrap: true,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: StyleProjects()
                                                            .TopicMain3U,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        child: Column(
                                          children: [
                                            IconButton(
                                              icon: const Icon(
                                                  Icons.no_crash_outlined,
                                                  color: Color.fromARGB(
                                                      255, 000, 000, 000)),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //
                              ),
                            );
                          });
                    }),
              ),

              //
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
    );
  }
}








*/

//2

/*
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:modprinting/utility/stylepro.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            //image: AssetImage("assets/images/bg952.jpg"),
            image: AssetImage("assets/images/bg854.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 20,
              bottom: 0,
              left: 0,
              right: 0,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  _backButton(),
                  StyleProjects().boxSpaceTop2,
                  Center(
                    child: Text(
                      'หมวดแบบสิ่งพิมพ์',
                      style: TextStyle(
                          fontFamily: 'THSarabunNew',
                          //color: const Color(0xff001326),
                          //color: const Color(0xffffd66c),
                          color: const Color(0xff6cdeff),
                          fontWeight: FontWeight.bold,
                          fontSize: 36),
                    ),
                  ),

/*
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      //color: const Color(0xfff0f7f9),
                      color: const Color(0xfffffefd),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'แบบพิมพ์ทั่วไปราชการ',
                                  style: TextStyle(
                                      fontFamily: 'THSarabunNew',
                                      color: const Color(0xff004080),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      //color: const Color(0xfff0f7f9),
                      color: const Color(0xfffffefd),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'แบบพิมพ์สั่งพิมพ์เฉพาะ',
                                  style: TextStyle(
                                      fontFamily: 'THSarabunNew',
                                      color: const Color(0xff004080),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      //color: const Color(0xfff0f7f9),
                      color: const Color(0xfffffefd),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'แบบพิมพ์ ส.ค.ส./สมุดไดอารี่',
                                  style: TextStyle(
                                      fontFamily: 'THSarabunNew',
                                      color: const Color(0xff004080),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      //color: const Color(0xfff0f7f9),
                      color: const Color(0xfffffefd),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'แบบพิมพ์สั่งพิมพ์พิเศษระบุชื่อหน่วยงาน',
                                  style: TextStyle(
                                      fontFamily: 'THSarabunNew',
                                      color: const Color(0xff004080),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      //color: const Color(0xfff0f7f9),
                      color: const Color(0xfffffefd),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[

                        SizedBox(
                          height: 20,
                        ),

                        Container(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  'แบบพิมพ์อื่นๆ',
                                  style: TextStyle(
                                      fontFamily: 'THSarabunNew',
                                      color: const Color(0xff004080),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),

*/

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 100,
                        child: Image(
                          image: AssetImage(
                            "assets/images/master.png",
                          ),
                        ),
                      ),
                      //
                      Container(
                        height: 100,
                        child: Image(
                          image: AssetImage(
                            "assets/images/master.png",
                          ),
                        ),
                      ),
                      //
                      Container(
                        height: 100,
                        child: Image(
                          image: AssetImage(
                            "assets/images/master.png",
                          ),
                        ),
                      ),
                      //
                      Container(
                        height: 100,
                        child: Image(
                          image: AssetImage(
                            "assets/images/master.png",
                          ),
                        ),
                      ),
                      //
                    ],
                  ),

                  //

                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Card(
                      color: StyleProjects().primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        child: new Row(
                          children: <Widget>[
                            new Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[new Text("Hello World")],
                              ),
                            ),
                            new Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  new Text(
                                      "This is a long text this is a long test this is This is a long text this is a long test this is This is a long text this is a long test this is This is a long text this is a long test this is This is a long text this is a long test this is This is a long text this is a long test this is ")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  Card(
                    color: StyleProjects().primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            flex: 1,
                            child: Column(
                              children: <Widget>[new Text("Hello World")],
                            ),
                          ),
                          new Expanded(
                            flex: 2,
                            child: Column(
                              children: <Widget>[
                                new Text(
                                    "This is a long text this is a long test this is This is a long text this is a long test this is This is a long text this is a long test this is This is a long text this is a long test this is This is a long text this is a long test this is This is a long text this is a long test this is ")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

//
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: const Color(0xffffc52e),
              ),
            ),
            Text(
              'Back',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffc52e),
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/

import 'dart:async';
import 'dart:io';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modprinting/components/customer/cart/cartpage.dart';
import 'package:modprinting/components/guest/Authentication/authentication.dart';
import 'package:modprinting/components/guest/catalogpage/allproducts.dart';
import 'package:modprinting/components/guest/catalogpage/diary_forms.dart';
import 'package:modprinting/components/guest/catalogpage/exclusive_forms.dart';
import 'package:modprinting/components/guest/catalogpage/generalgovernment_forms.dart';
import 'package:modprinting/components/guest/catalogpage/other_forms.dart';
import 'package:modprinting/components/guest/catalogpage/specifically_forms.dart';
import 'package:modprinting/utility/stylepro.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  List<String> nameIcons = [
    'b3.jpg',
    'b3.jpg',
    'b3.jpg',
    'b3.jpg',
    'b3.jpg',
  ];

  List<String> titles = [
    'แบบพิมพ์ทั่วไปราชการ',
    'แบบพิมพ์สั่งพิมพ์เฉพาะ',
    'แบบพิมพ์ ส.ค.ส./สมุดไดอารี่',
    'แบบพิมพ์สั่งพิมพ์พิเศษระบุชื่อหน่วยงาน',
    'แบบพิมพ์อื่นๆ',
  ];

  List<Widget> widgets = [];


//route
  List<Widget> routToWidgdets = [
    //AllProductsPage(),     CatalogPage(),
    GeneralGovernmentFormsPage(),
    SpecificallyFormsPage(),
    DiaryFormPage(),
    ExclusiveFormsPage(),
    OthersFormsPage(),
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

    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xff004080),
        backgroundColor: StyleProjects().primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_shopping_cart_sharp,
              color: Colors.white,
              size: 30.0,
            ),
            /*
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },

            */

            onPressed: () {
              //deleteDataNew(doc!);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Color.fromARGB(255, 255, 222, 222),
                    title: Text(
                      'Login',
                      style: StyleProjects().TextAlertH1Style,
                    ),
                    content: Text(
                      'คุณต้องเข้าสู่ระบบก่อน !',
                      style: StyleProjects().TextAlertH2Style,
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: Text(
                          'เข้าสู่ระบบ',
                          style: StyleProjects().TextAlertH2Style,
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
                      new FlatButton(
                        child: Text(
                          'ยกเลิก',
                          style: StyleProjects().TextAlertH2Style,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
     
     

     //
      ),

/*
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg204.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            imageSliderCarousel, //Slide image
            StyleProjects().boxSpaceTop2,

            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: <Widget>[
                  StyleProjects().boxSpace2,
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        thickness: 2,
                        //color: const Color(0xFFFFFFFF),
                        color: const Color(0xffffda7a),
                      ),
                    ),
                  ),
                  Text(
                    "หมวดหมู่แบบพิมพ์",
                    /*
                    style: TextStyle(
                      fontFamily: 'THSarabunNew',
                      fontSize: 20,
                      color: const Color(0xFFFFFFFF),
                      ),
                      */
                    style: StyleProjects().H2style,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        thickness: 2,
                        //color: const Color(0xFFFFFFFF),
                        color: const Color(0xffffda7a),
                      ),
                    ),
                  ),
                  StyleProjects().boxSpace2,
                  //
                  Expanded(
                    child: GridView.count(
                      padding: EdgeInsets.all(10.0),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 3,
                      children: widgets,
                    ),
                  ),
                  //
                  Expanded(
                child: StreamBuilder(
                    /*
                    stream: FirebaseFirestore.instance
                        .collection("Users")
                        //.orderBy('id', descending: true)
                        .orderBy('level')
                        .snapshots(),

*/

                    stream: FirebaseFirestore.instance
                        .collection('Products')
                        .where("category",) // isEqualTo: "admin")
                        //.orderBy("level", descending: false)
                        
                        //.orderBy('admin', descending: false)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Text(
                          'กรุณารอสักครู่นะคะ...',
                          style: StyleProjects().H2style,
                        );
                      }
                      int length = snapshot.data!.docs.length;
                      return ListView.builder(
                          itemCount: length,
                          padding: EdgeInsets.all(10),
                          itemBuilder: (_, int index) {
                            final QueryDocumentSnapshot<Object?>? doc =
                                snapshot.data?.docs[index];
                            return Card(
                              margin: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                              //color: Color.fromARGB(255, 179, 232, 250),
                              //color: Color.fromARGB(255, 179, 213, 241),
                              color: Color.fromARGB(255, 253, 253, 253),

                              child: Container(
                                height: 135,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                //padding: EdgeInsets.all(10),

                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.bottomLeft,
                                            child: Image.network(
                                              snapshot.data?.docs
                                                  .elementAt(index)['images'],
                                              fit: BoxFit.fill,
                                              width: 70,
                                              height: 50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'ชื่อ : ',
                                                      style: StyleProjects()
                                                          .TopicMain3U2,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      child: Text(
                                                        snapshot.data?.docs
                                                            .elementAt(
                                                                index)['fname'],
                                                        softWrap: true,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: StyleProjects()
                                                            .TopicMain3U,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'อีเมล : ',
                                                      style: StyleProjects()
                                                          .TopicMain3U2,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      child: Text(
                                                        snapshot.data?.docs
                                                            .elementAt(
                                                                index)['email'],
                                                        softWrap: true,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: StyleProjects()
                                                            .TopicMain3U,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'เบอร์โทร : ',
                                                      style: StyleProjects()
                                                          .TopicMain3U2,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      child: Text(
                                                        snapshot.data?.docs
                                                            .elementAt(
                                                                index)['phone'],
                                                        softWrap: true,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: StyleProjects()
                                                            .TopicMain3U,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    /*
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        child: Column(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.edit,
                                                  color: Color.fromARGB(
                                                      255, 000, 000, 000)),
                                              onPressed: () {
                                                Route route = MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddAdminPage(),
                                                );
                                                Navigator.push(context, route);
                                              },
                                            ),

                                            IconButton(
                                                onPressed: () {
                                                  //deleteDataNew(doc!);
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        backgroundColor:
                                                            //Color.fromARGB(255, 255, 199, 199),
                                                            Color.fromARGB(255,
                                                                255, 222, 222),
                                                        title: Text(
                                                          'คำเตือน',
                                                          style: StyleProjects()
                                                              .TextAlertH1Style,
                                                        ),
                                                        content: Text(
                                                          'คุณต้องการลบผู้ดูแลนี้ ?',
                                                          style: StyleProjects()
                                                              .TextAlertH2Style,
                                                        ),
                                                        actions: <Widget>[
                                                          new FlatButton(
                                                            child: Text(
                                                              'ลบ',
                                                              style: StyleProjects()
                                                                  .TextAlertH3Style,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              deleteDataNew(
                                                                  doc!);
                                                              //deleteData(doc!),
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                          new FlatButton(
                                                            child: Text(
                                                              'ยกเลิก',
                                                              style: StyleProjects()
                                                                  .TextAlertH2Style,
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Color.fromARGB(
                                                      255, 219, 49, 49),
                                                )),

                                            //
                                          ],
                                        ),
                                      ),
                                    ),
                                 
                                 */
                                  ],
                                ),

                                //
                              ),
                            );
                          });
                    }),
              ),
            
                ],
              ),
            ),



            //
          ],
        ),
      ),
    
    
    
    */

      body: SafeArea(
        child: Container(
          //color: StyleProjects().baseColor,
          //color: StyleProjects().primaryColor,


          /*
           decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xff59d3fc),
                Color(0xff124699),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),

          */




          child: Column(
            children: [
              imageSliderCarousel, //Slide image
              StyleProjects().boxSpaceTop2,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                          color: const Color(0xff000f3b),
                          //color: const Color(0xffffda7a),
                        ),
                      ),
                    ),
                    Text(
                      'หมวดหมู่',
                      textAlign: TextAlign.center,
                      style: StyleProjects().H10style,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                          //color: const Color(0xffffda7a),
                          color: const Color(0xff000f3b),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: StreamBuilder(
                    
                    stream: FirebaseFirestore.instance
                        .collection('Category')
                        //.where("category", isEqualTo: "")
                        //.orderBy("category", descending: false)

                        .orderBy('id', descending: false)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Text(
                          'กรุณารอสักครู่นะคะ...',
                          style: StyleProjects().TopicMain2,
                        );
                      }
                      int length = snapshot.data!.docs.length;
                      return ListView.builder(
                          itemCount: length,
                          padding: EdgeInsets.all(20),
                          itemBuilder: (_, int index) {
                            final QueryDocumentSnapshot<Object?>? doc =
                                snapshot.data?.docs[index];
                            return InkWell(
                             
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => routToWidgdets[index],
                                ),
                              ),
                              child: Card(
                                margin: const EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 5,
                                //color: Color.fromARGB(255, 179, 232, 250),
                                //color: Color.fromARGB(255, 179, 213, 241),
                                color: Color.fromARGB(255, 253, 253, 253),

                                child: Container(
                                  height: 120,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  //padding: EdgeInsets.all(10),

                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Alignment.bottomLeft,
                                              child: Image.network(
                                                snapshot.data?.docs
                                                    .elementAt(index)['images'],
                                                fit: BoxFit.fill,
                                                width: 100,
                                                height: 100,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          //padding: EdgeInsets.all(10),
                                          padding: EdgeInsets.only(left: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  /*
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'หมวดหมู่ : ',
                                                          style: StyleProjects()
                                                              .TopicMain3U2,
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  */
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: 175 ,
                                                        child: Text(
                                                          snapshot.data?.docs
                                                                  .elementAt(
                                                                      index)[
                                                              'categoryname'],
                                                          softWrap: true,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: StyleProjects()
                                                              .TopicMain11,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),

                                           
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  //
                                ),
                              ),
                            );
                          });
                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }

  //
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
        //color: const Color(0xffb3e5fc),
        color: Color.fromARGB(255, 255, 255, 255),
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
    );
  }

//222

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: const Color(0xffffda7a),
              ),
            ),
            Text(
              'Back',
              style: TextStyle(
                fontFamily: 'TH Sarabun New',
                fontSize: 18,
                color: const Color(0xffffda7a),
              ),
            )
          ],
        ),
      ),
    );
  }

  //
}
