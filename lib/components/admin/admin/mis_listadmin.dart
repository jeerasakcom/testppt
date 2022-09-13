import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modprinting/components/admin/admin/mis_addadmin.dart';
import 'package:modprinting/models/user_model.dart';
import 'package:modprinting/utility/stylepro.dart';

class ListAdminPage extends StatefulWidget {
  const ListAdminPage({Key? key}) : super(key: key);

  @override
  State<ListAdminPage> createState() => _ListAdminPageState();
}

class _ListAdminPageState extends State<ListAdminPage> {
  String? id;
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  
  String? level = 'admin';

  String? images,
      fname,
      lname,
      address,
      department,
      phone,
      email,
      password,
      token;

  bool trapicondelete = false;
  UserModel? userModel;

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
      content: Text("คุณต้องการลบแบบพิมพ์นี้ ?"),
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
        .collection('Users')
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
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

/*
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
      ),



      */

      //backgroundColor: const Color(0xFFF7F7F7),
      //backgroundColor: Color.fromARGB(255, 29, 47, 102),
      //backgroundColor: Color.fromARGB(255, 91, 100, 156),
      backgroundColor: Color.fromARGB(255, 0, 52, 163),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Container(
          height: height,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              StyleProjects().BoxSpace,
              StyleProjects().header1(),
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
                          //color: const Color(0xff000f3b),
                          color: const Color(0xffffda7a),
                        ),
                      ),
                    ),
                    Text(
                      'ผู้ดูแลระบบ',
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
                        .collection('Users')
                        .where("level", isEqualTo: "admin")
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 0, 110, 244),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => AddAdminPage());
          Navigator.push(context, route);
        },
      ),
    );
  }
}
