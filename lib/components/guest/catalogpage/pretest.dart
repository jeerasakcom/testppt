import 'dart:async';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modprinting/components/customer/cart/cartpage.dart';
import 'package:modprinting/components/guest/catalogpage/diary_forms.dart';
import 'package:modprinting/components/guest/catalogpage/exclusive_forms.dart';
import 'package:modprinting/components/guest/catalogpage/generalgovernment_forms.dart';
import 'package:modprinting/components/guest/catalogpage/other_forms.dart';
import 'package:modprinting/components/guest/catalogpage/specifically_forms.dart';
import 'package:modprinting/models/product_model.dart';
import 'package:modprinting/utility/stylepro.dart';

final List<String> imagesList = [
  'http://tdvpprint.com/uploads/banners/banner_HXVY8HPOMYOKYEWZI5WLGCHNH.jpg',
  "http://tdvpprint.com/uploads/banners/banner_AF6N9LHS43AVZKHW39GOJZCV0.jpg",
  'http://tdvpprint.com/uploads/banners/banner_HJ06DQIG3LBWHYAMRWKNCYATH.jpg',
  'http://tdvpprint.com/uploads/banners/banner_AF6N9LHS43AVZKHW39GOJZCV0.jpg',
  'http://tdvpprint.com/uploads/banners/banner_DNOYBWK4NACVYN1VV9G0YPAP6.jpg',
];

class CategoryHomePage extends StatefulWidget {
  CategoryHomePage({Key? key}) : super(key: key);

  @override
  State<CategoryHomePage> createState() => _CategoryHomePageState();
}

class _CategoryHomePageState extends State<CategoryHomePage> {
  File? file;
  String? id, name, price, detail, quantity, category, images;
  ProductModel? productModel;

  //
  int _currentIndex = 0;

  //
  List<Widget> routToWidgdets = [
    //AllProductsPage(),     CatalogPage(),
    GeneralGovernmentFormsPage(),
    SpecificallyFormsPage(),
    DiaryFormPage(),
    ExclusiveFormsPage(),
    OthersFormsPage(),
  ];

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'ค้นหา...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),

/*
        title: Padding(
          //padding: EdgeInsets.only(left: 5),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Card(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: 'ค้นหา...'),
              onChanged: (val) {
                setState(
                  () {
                    name = val;
                  },
                );
              },
            ),
          ),
        ),
        */

        //
      ),

      body: Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          //color: Color.fromARGB(255, 251, 251, 251),
          //color: StyleProjects().primaryColor,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // list

/*
              ListTile(
                shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.orange, width: 4),
                borderRadius: BorderRadius.circular(15),
              ),
              iconColor: Colors.orange,
              leading: const Icon(
                Icons.light,
                size: 30,
              ),
              title: const Text('Item Two'),
              subtitle: const Text('RoundedRectangleBorder'),
              trailing: const Icon(
                Icons.play_arrow,
                size: 30,
              ),
              ),




*/

              /*
               Expanded(
                    flex: 1,
                    child: 
                    SingleChildScrollView(
                        child: Row(
                      children: [
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                      ],
                    )),
                  ),

*/

/*
              GestureDetector(
                child: Expanded(
                  flex: 1,
                  child: Row(
                  children: [
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                      ],
                    

                ) ),
              ),   
                
*/

              //hearder
              /*
              Center(
                child: Text(
                  'หมวดหมู่',
                  textAlign: TextAlign.center,
                  style: StyleProjects().TopicMainT3,
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
                                                        width: 175,
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

              */
              StyleProjects().boxSpaceTop2,
              HeaderPage(),
              StyleProjects().boxSpace2,
              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Products")
                        //.orderBy('id', descending: true)
                        //.orderBy('id')

                        .orderBy('id', descending: false)
                        //.where("category", isEqualTo: "แบบพิมพ์ทั่วไปราชการ")

                        //.where('id', isEqualTo: id)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Text(
                          'กรุณารอสักครู่นะคะ...',
                          textAlign: TextAlign.center,
                          style: StyleProjects().TopicMain8,
                          /*
                          style: TextStyle(
                            fontFamily: 'THSarabunNew',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF14005C),
                          ),
                          */
                        );
                      }
                      int length = snapshot.data!.docs.length;
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.6,
                          ),
                          itemCount: length,
                          padding: EdgeInsets.all(5),
                          itemBuilder: (_, int index) {
                            //final DocumentSnapshot doc =
                            final QueryDocumentSnapshot<Object?>? doc =
                                snapshot.data!.docs[index];
                            return new Container(
                              //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              padding: EdgeInsets.all(5),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                elevation: 5,
                                //color: const Color(0xFF3B3B3B),
                                //color: const Color(0xFFABDCFF),
                                //color: const Color(0xFF20DAE9),
                                //color: const Color(0xFFFFFFFF),
                                color: Color.fromARGB(255, 225, 255, 245),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    StyleProjects().boxSpace3,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        InkWell(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Image.network(
                                              snapshot.data?.docs
                                                  .elementAt(index)['images'],
                                              fit: BoxFit.fill,
                                              width: 100,
                                              height: 120,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    StyleProjects().boxSpace3,

                                    Row(
                                      children: [
                                        StyleProjects().boxSpacebetweenK,
                                        Text(
                                          'รหัสสินค้า :',
                                          style: StyleProjects().titleH4Style,
                                        ),
                                        StyleProjects().boxSpacebetweenK,
                                        Container(
                                          width: 75,
                                          child: Text(
                                            snapshot.data?.docs
                                                .elementAt(index)['id'],
                                            softWrap: true,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            //style: StyleProjects().titleH4Style,
                                            style:
                                                StyleProjects().titleH4StyleK,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        StyleProjects().boxSpacebetweenK,
                                        Container(
                                          width: 130,
                                          child: Text(
                                            snapshot.data?.docs
                                                .elementAt(index)['name'],
                                            softWrap: true,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: StyleProjects().titleH4Style,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'ราคา :',
                                          style: StyleProjects().titleH4Style,
                                        ),
                                        StyleProjects().boxSpacebetweenK,
                                        Text(
                                          snapshot.data?.docs
                                              .elementAt(index)['price'],
                                          style: StyleProjects().titleH4StyleK,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'บาท',
                                          style: StyleProjects().titleH4Style,
                                        ),
                                      ],
                                    ),

                                    //
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                          child: new Row(
                                            children: <Widget>[
                                              IconButton(
                                                icon: Icon(
                                                  Icons.description,
                                                  color: Color.fromARGB(
                                                      249, 221, 4, 159),
                                                ),
                                                onPressed: () {},
                                              ),
                                              IconButton(
                                                  icon: Icon(
                                                    Icons
                                                        .add_shopping_cart_outlined,
                                                    color: Colors.redAccent,
                                                  ),
                                                  onPressed: () {}),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              ),
            ],
          ),
        ),

        //],
      ),

      //),

      // ),

      ///
      ///
      ///
      ///
      ///
      ///
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_shopping_cart_sharp,
          color: Colors.white,
        ),
        //backgroundColor: Color.fromARGB(255, 0, 110, 244),
        //  backgroundColor: Color.fromARGB(255, 244, 0, 110),
        backgroundColor: Color.fromARGB(255, 0, 155, 47),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => CartPage());
          Navigator.push(context, route);
        },
      ),
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
                  color: const Color(0xff000f3b),
                ),
              ),
            ),
            Text(
              'แบบสิ่งพิมพ์',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                //color: const Color(0xffffda7a),
                color: const Color(0xff000f3b),
              ),
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
    );
  }

  //
}
