import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modprinting/components/customer/cart/cartpage.dart';
import 'package:modprinting/utility/stylepro.dart';


class ExclusiveFormsPage extends StatefulWidget {
  ExclusiveFormsPage({Key? key}) : super(key: key);

  @override
  State<ExclusiveFormsPage> createState() => _ExclusiveFormsPageState();
}

class _ExclusiveFormsPageState extends State<ExclusiveFormsPage> {
 String? name;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      /*
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),*/

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
              },);
            },
          ),
        ),
      ),

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
                      'แบบสิ่งพิมพ์',
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
                        .collection("Products")
                        //.orderBy('id', descending: true)
                        //.orderBy('id')
                        .where("category", isEqualTo: "แบบพิมพ์สั่งพิมพ์พิเศษระบุชื่อหน่วยงาน")
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

                      //ListView

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
                                height: 175,
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
                                          /*
                                            Text(
                                              'รูปภาพสินค้า',
                                              style:
                                                  StyleProjects().TopicMain3U2,
                                              textAlign: TextAlign.justify,
                                            ),
                                            */

                                          Container(
                                            alignment: Alignment.bottomLeft,
                                            child: Image.network(
                                              snapshot.data?.docs
                                                  .elementAt(index)['images'],
                                              fit: BoxFit.fill,
                                              width: 75,
                                              height: 100,
                                            ),
                                          ),
                                        ],
                                      ),
                                      /*
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Image.network(
                                              snapshot.data?.docs
                                                  .elementAt(index)['images'],
                                              width: 200,
                                              height: 150,
                                            ),
                                          ),
                                        ),
                                     
                                     
                                     
                                     */
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
                                                Container(
                                                  width: 120,
                                                  child: Text(
                                                    snapshot.data?.docs
                                                        .elementAt(
                                                            index)['category'],
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: StyleProjects()
                                                        .TopicMain3U,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'รหัสสินค้า :',
                                                  style: StyleProjects()
                                                      .TopicMain3U2,
                                                ),
                                                StyleProjects().boxSpacebetween,
                                                Container(
                                                  width: 65,
                                                  child: Text(
                                                    snapshot.data?.docs
                                                        .elementAt(index)['id'],
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: StyleProjects()
                                                        .TopicMain3U,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            //1
                                            /*
                                            Row(
                                              children: [
                                                Text(
                                                  'ชื่อสินค้า :',
                                                  style: StyleProjects()
                                                      .TopicMain3U2,
                                                ),
                                                StyleProjects().boxSpacebetween,
                                                Container(
                                                  width: 115,
                                                  child: Text(
                                                    snapshot.data?.docs
                                                        .elementAt(
                                                            index)['name'],
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: StyleProjects()
                                                        .TopicMain3U,
                                                  ),
                                                ),
                                              ],
                                            ),
*/
                                            //2
                                            Column(
                                              children: [
                                                Row(
                                                  children: [

                                                    /*
                                                    Text(
                                                      'ชื่อสินค้า :',
                                                      style: StyleProjects()
                                                          .TopicMain3U2,
                                                    ),

                                                    */

/*
                                                    Container(
                                                      width: 150,
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
                                                  */
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    //Text(' - '),
                                                    Container(
                                                      width: 150,
                                                      child: Text(
                                                        snapshot.data?.docs
                                                            .elementAt(
                                                                index)['name'],
                                                        softWrap: true,
                                                        maxLines: 2,
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
                                                Text(
                                                  'ราคา :',
                                                  style: StyleProjects()
                                                      .TopicMain3U2,
                                                ),
                                                StyleProjects().boxSpacebetween,
                                                Container(
                                                  //width: 65,
                                                  child: Text(
                                                    snapshot.data?.docs
                                                        .elementAt(
                                                            index)['price'],
                                                    softWrap: true,
                                                    //maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: StyleProjects()
                                                        .TopicMain3U,
                                                  ),
                                                ),
                                                StyleProjects().boxSpacebetween,
                                                Text(
                                                  'บาท',
                                                  style: StyleProjects()
                                                      .TopicMain3U2,
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
                                            EdgeInsets.symmetric(vertical: 50),
                                        child: Column(
                                          children: [
                                            IconButton(
                                              icon: const Icon(
                                                  Icons.add_shopping_cart_sharp,
                                                  /*
                                                  color: Color.fromARGB(
                                                      255, 126, 201, 103),
                                                     */ 

                                                    color: Color.fromARGB(255, 0, 64, 214),
                                                      
                                                      ),


                                              //onPressed: () {}, //UpdateDataProductsPages
                                              onPressed: () {
                                                Route route = MaterialPageRoute(
                                                  builder: (context) =>
                                                      CartPage(),
                                                );
                                                Navigator.push(context, route);
                                              },
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_shopping_cart_sharp,
          color: Colors.white,
        ),
        //backgroundColor: Color.fromARGB(255, 0, 110, 244),
        backgroundColor: Color.fromARGB(255, 244, 0, 110),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => CartPage());
          Navigator.push(context, route);
        },
      ),
    );
  }
}
