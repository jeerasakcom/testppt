import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modprinting/components/admin/news/mis_addnews.dart';
import 'package:modprinting/components/admin/products/mis_addproducts.dart';
import 'package:modprinting/models/product_model.dart';
import 'package:modprinting/utility/stylepro.dart';

class ListNewsPage extends StatefulWidget {
  const ListNewsPage({Key? key}) : super(key: key);

  @override
  State<ListNewsPage> createState() => _ListNewsPageState();
}

class _ListNewsPageState extends State<ListNewsPage> {
  String? id;
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  String? productid, name, detail, price, quantity;
  bool trapicondelete = false;
  ProductModel? productModel;

  //

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("ยกเลิก"),
      onPressed: () {},
    );
    Widget continueButton = FlatButton(
      child: Text("ลบ"),
      onPressed: () {
        deleteDataNew;
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("คำเตือน!"),
      content: Text("คุณต้องการลบข่าวสารนี้ ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //

  deleteDataNew(DocumentSnapshot doc) async {
    FirebaseFirestore.instance
        .collection('News')
        .doc(doc.id)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: StyleProjects().backgroundState,
      body: Padding(
        padding: EdgeInsets.zero,
        child: Container(
          height: height,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              StyleProjects().BoxSpace,
              StyleProjects().header1(),
              StyleProjects().boxSpaceTop2,

//ค้นหา
/*
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Card(
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
              ),


*/
              //StyleProjects().boxSpaceTop2,

              // header
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                          //color: const Color(0xff000f3b),
                          color: const Color(0xffffda7a),
                        ),
                      ),
                    ),
                    Text(
                      'ข่าวสาร',
                      textAlign: TextAlign.center,
                      style: StyleProjects().H2style,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                          color: const Color(0xffffda7a),
                          //color: const Color(0xff000f3b),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

//2

/*
                const SizedBox(height: 10),
                Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Products")
                        .orderBy('id')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Text(
                          "ไม่มีข้อมูล",
                          style: StyleProjects().TopicMain2,
                        );
                      return Text(
                        'กรุณารอสักครู่นะคะ...',
                        style: StyleProjects().TopicMain6,
                      );
                    },
                  ),
                ),
              
              */

              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("News")
                        //.orderBy('id', descending: true)
                        .orderBy('datetime', descending: true)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Text(
                          'กรุณารอสักครู่นะคะ...',
                          style: StyleProjects().H2style,
                        );
                      }
                      /*
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
                              final QueryDocumentSnapshot<Object?>? doc =
                                  snapshot.data?.docs[index];
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                //padding: EdgeInsets.all(5),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  //color: const Color(0xFF3B3B3B),
                                  //color: const Color(0xFFABDCFF),
                                  color: const Color(0xFF20DAE9),
                                  //color: const Color(0xFFFFFFFF),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 5,
                                      ),
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
                                                width: 100,
                                                height: 85,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 120,
                                            child: Text(
                                              snapshot.data?.docs
                                                  .elementAt(index)['category'],
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontFamily: 'THSarabunNew',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xff000f3b),
                                              ),
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
                                            'รหัสสินค้า :',
                                            style: TextStyle(
                                              fontFamily: 'THSarabunNew',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xff000f3b),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 65,
                                            child: Text(
                                              snapshot.data?.docs
                                                  .elementAt(index)['id'],
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontFamily: 'THSarabunNew',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xff000f3b),
                                              ),
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
                                            'ชื่อสินค้า :',
                                            style: TextStyle(
                                              fontFamily: 'THSarabunNew',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xff000f3b),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 65,
                                            child: Text(
                                              snapshot.data?.docs
                                                  .elementAt(index)['name'],
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontFamily: 'THSarabunNew',
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xff000f3b),
                                              ),
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
                                            style: TextStyle(
                                              fontFamily: 'THSarabunNew',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xff000f3b),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            snapshot.data!.docs
                                                .elementAt(index)['price']
                                                .toString(),
                                            style: TextStyle(
                                              fontFamily: 'THSarabunNew',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xff000f3b),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'บาท',
                                            style: TextStyle(
                                              fontFamily: 'THSarabunNew',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xff000f3b),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            child: new Row(
                                              children: <Widget>[
                                                IconButton(
                                                  icon: Icon(
                                                    //Icons.description,
                                                    Icons.edit,
                                                    color: Colors.blueAccent,
                                                  ),
                                                  onPressed: () {
                                                    /*
                                                    Route route = MaterialPageRoute(
                                                        builder: (context) =>
                                                            UpdateProductsPages());
                                                    
                                                    Navigator.push(
                                                        context,  route);
                                                        */

                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                /*
                                              IconButton(
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Colors.blueAccent,
                                                ),
                                                onPressed: () {},
                                              ),
                                              */
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.redAccent,
                                                  ),

                                                  //ลบเลย

                                                  onPressed: () =>
                                                      deleteData(doc!),

                                                  // แสดง alert
                                                  /*
                                                onPressed: () async {
                                                  showAlertDialog(context);
                                                },
                                                */

                                                  // ลบแล้ว pop
                                                  /*
                                                onPressed: () async {
                                                  setState(() {
                                                    trapicondelete = true;
                                                  });

                                                  await deleteData(doc);

                                                  setState(() {
                                                    trapicondelete = false;
                                                  });

                                                  Navigator.of(context).pop();
                                                },

                                                */
                                                ),
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
                      
                      */

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
                              elevation: 4,
                              //color: const Color(0xFF3B3B3B),
                              //color: const Color(0xFFABDCFF),
                              //color: const Color(0xFF20DAE9),
                              color: const Color(0xFFFFFFFF),

                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            //new
                                            Row(
                                              children: [
                                                Text(
                                                  'หัวข้อข่าว :',
                                                  style: TextStyle(
                                                    fontFamily: 'THSarabunNew',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        const Color(0xff000f3b),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  width: 125,
                                                  child: Text(
                                                    snapshot.data!.docs
                                                        .elementAt(
                                                            index)['title'],
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'THSarabunNew',
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: const Color(
                                                          0xff000f3b),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'วันที่ :',
                                                  style: TextStyle(
                                                    fontFamily: 'THSarabunNew',
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        const Color(0xff000f3b),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  snapshot.data?.docs.elementAt(
                                                      index)['datetime'],
                                                  style: TextStyle(
                                                    fontFamily: 'THSarabunNew',
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color:
                                                        const Color(0xff000f3b),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new IconButton(
                                          icon: const Icon(
                                            Icons.edit,
                                            color: const Color(0xFF000D55),
                                          ),
                                          onPressed: () {},
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
                                                        Color.fromARGB(
                                                            255, 255, 222, 222),
                                                    title: Text(
                                                      'คำเตือน',
                                                      style: StyleProjects()
                                                          .TextAlertH1Style,
                                                    ),
                                                    content: Text(
                                                      'คุณต้องการลบข่าวนี้ ?',
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
                                                        onPressed: () async {
                                                          deleteDataNew(doc!);
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
                                                          Navigator.of(context)
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
                                      ],
                                    ),
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 0, 110, 244),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => AddNewsPages());
          Navigator.push(context, route);
        },
      ),
    );
  }
}
