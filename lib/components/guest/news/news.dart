import 'dart:io';
import 'dart:async';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math' as math;
import 'package:expandable/expandable.dart';
import 'package:modprinting/utility/stylepro.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String? id;
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return Scaffold(
      //backgroundColor: const Color(0xFFF7F7F7),
      //backgroundColor: const Color(0xFFC5C5C5),
      //backgroundColor: StyleProjects().backgroundState,

      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          //bg

          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                // Color(0xff59d3fc),
                // Color(0xff124699),
                // Color(0xff00d4ff),
                Color(0xff090979),
               // Color(0xff233a58),
                Color(0xff003399),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),

//

/*
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg950.jpg"),
              fit: BoxFit.cover,
            ),
          ),
*/

          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 50),
              _backButton(),
              SizedBox(height: 20),
              headertdvp1(),
              SizedBox(height: 20),
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
                          //color: const Color(0xffffda7a),
                          //color: const Color(0xff000f3b),
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    Text(
                      'ข่าวสาร',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'THSarabunNew',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        //color: const Color(0xffffda7a),
                        //color: const Color(0xff000f3b),
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                          //color: const Color(0xffffda7a),
                          //color: const Color(0xff000f3b),
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("News")
                      .orderBy('datetime', descending: true)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Text(
                        'กรุณารอสักครู่นะคะ...',
                        style: TextStyle(
                          fontFamily: 'THSarabunNew',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFFFFFF),
                        ),
                      );
                    }
                    int length = snapshot.data!.docs.length;
                    return ListView.builder(
                        padding: EdgeInsets.all(10.0),
                        itemCount: length,
                        itemBuilder: (_, int index) {
                          final QueryDocumentSnapshot<Object?>? doc =
                              snapshot.data?.docs[index];

/*
                          return ExpandableNotifier(
                              child: Padding(
                            //padding: const EdgeInsets.all(10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),

                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 5,
                              //color: Colors.black54,
                              color: Colors.white70,
                              clipBehavior: Clip.antiAlias,

                              child: Column(
                                children: <Widget>[
                                  ScrollOnExpand(
                                    scrollOnExpand: true,
                                    scrollOnCollapse: false,
                                    theme: const ExpandableThemeData(
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      tapBodyToCollapse: true,
                                    ),
                                    child: Container(
                                      height: 150,
                                      child: SingleChildScrollView(
                                        child: ExpandablePanel(
                                          theme: const ExpandableThemeData(
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            tapBodyToCollapse: true,
                                            iconPadding: EdgeInsets.all(20),
                                          ),
                                          header: 
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 10,
                                                bottom: 15),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'วันที่ : ',
                                                  textAlign: TextAlign.start,
                                                  style: StyleProjects()
                                                      .TopicMain8,
                                                ),
                                                Text(
                                                  snapshot.data?.docs.elementAt(
                                                      index)['datetime'],
                                                  softWrap: true,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: StyleProjects()
                                                      .TopicMain8,
                                                ),
                                              ],
                                            ),
                                          ),
                                          collapsed: Container(
                                            padding: EdgeInsets.only(
                                              left: 15,
                                            ),
                                            width: 250,
                                            child: 
                                            Text(
                                              snapshot.data?.docs
                                                  .elementAt(index)['title'],
                                              softWrap: true,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.start,
                                              style: StyleProjects().TopicMain8,
                                            ),
                                          ),

                                          //1
/*
                                          expanded: Column(
                                            children: [
                                              Text(
                                                  snapshot.data?.docs.elementAt(
                                                      index)['title'],
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              Text(
                                                  snapshot.data?.docs.elementAt(
                                                      index)['detail'],
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Image.network(
                                                          snapshot.data?.docs
                                                                  .elementAt(
                                                                      index)[
                                                              'images'],
                                                          fit: BoxFit.fill,
                                                          width: 250,
                                                          height: 300,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              StyleProjects().boxSpaceTop2,

                                              /* Text(
                                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vehicula quam id nunc porttitor tincidunt a tincidunt sem. Sed dignissim varius urna, quis dignissim diam consequat ac. In non eleifend enim. Vivamus ut elit ante. Vivamus at risus vitae ligula viverra imperdiet. Morbi vel imperdiet lectus. Etiam quis lectus justo. Aliquam pulvinar leo at ligula iaculis euismod. Phasellus quis fringilla enim, at porttitor est. ",
                                                    softWrap: true,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 16)),
                                                        */
                                            ],
                                          ),

*/

//2
                                          expanded: Column(
                                            children: <Widget>[
                                              /*
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Text(
                                                  snapshot.data!.docs.elementAt(
                                                      index)['title'],
                                                  softWrap: true,
                                                  overflow: TextOverflow.fade,
                                                  textAlign: TextAlign.start,
                                                  style: StyleProjects()
                                                      .TopicMain8,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Text(
                                                  snapshot.data!.docs.elementAt(
                                                      index)['detail'],
                                                  softWrap: true,
                                                  overflow: TextOverflow.fade,
                                                  textAlign: TextAlign.start,
                                                  style: StyleProjects()
                                                      .TopicMain8,
                                                ),
                                              ),
                                              */
                                              //StyleProjects().BoxSpace,
                                              

                                              Container(
                                                padding: EdgeInsets.only(left: 10),
                                                alignment: Alignment.bottomLeft,
                                                child: Text('หัวข้อข่าว',
                                                  style: StyleProjects()
                                                      .TopicMain8,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(left: 10),
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  snapshot.data!.docs.elementAt(
                                                      index)['title'],
                                                  softWrap: true,
                                                  overflow: TextOverflow.fade,
                                                  textAlign: TextAlign.start,
                                                  style: StyleProjects()
                                                      .TopicMain8,
                                                ),
                                              ),

                                              Container(
                                                padding: EdgeInsets.only(left: 10),
                                                alignment: Alignment.bottomLeft,
                                                child: Text('รายละเอียด',
                                                  style: StyleProjects()
                                                      .TopicMain8,
                                                ),
                                              ),

                                              Container(
                                                padding: EdgeInsets.only(left: 10),
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  snapshot.data!.docs.elementAt(
                                                      index)['detail'],
                                                  softWrap: true,
                                                  overflow: TextOverflow.fade,
                                                  textAlign: TextAlign.start,
                                                  style: StyleProjects()
                                                      .TopicMain8,
                                                ),
                                              ),
                                              StyleProjects().BoxSpace,
                                              Container(
                                            alignment: Alignment.center,
                                            child: Image.network(
                                              snapshot.data?.docs
                                                  .elementAt(index)['images'],
                                              fit: BoxFit.fill,
                                              width: 250,
                                              height: 300,
                                            ),
                                          ),


/*
                                              Container(
                                                alignment: Alignment.center,
                                                child: Image.network(
                                                  snapshot.data!.docs.elementAt(
                                                      index)['images'],
                                                  fit: BoxFit.fill,
                                                  width: 250,
                                                  height: 300,
                                                ),
                                              ),


                                              */
                                            ],
                                          ),

                                          /*
                                          Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      snapshot.data?.docs
                                                          .elementAt(
                                                              index)['title'],
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: StyleProjects()
                                                          .TopicMain8,
                                                    ),
                                                    Text(
                                                      snapshot.data?.docs
                                                          .elementAt(
                                                              index)['detail'],
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      style: StyleProjects()
                                                          .TopicMain8,
                                                    ),
                                                    StyleProjects().BoxSpace,
                                                    Container(
                                                      child: Image.network(
                                                        snapshot.data!.docs
                                                                .elementAt(
                                                                    index)[
                                                            'images'],
                                                        fit: BoxFit.fill,
                                                        width: 250,
                                                        height: 300,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              

                                              /*
                                              
                                              
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 15,
                                                    right: 15,
                                                    top: 10,
                                                    bottom: 15),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      snapshot.data?.docs
                                                          .elementAt(
                                                              index)['title'],
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: StyleProjects()
                                                          .TopicMain8,
                                                    ),
                                                    Text(
                                                      snapshot.data?.docs
                                                          .elementAt(
                                                              index)['detail'],
                                                      softWrap: true,
                                                      //maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: StyleProjects()
                                                          .TopicMain8,
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              /*
                                              Text(
                                                  snapshot.data?.docs.elementAt(
                                                      index)['title'],
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              Text(
                                                  snapshot.data?.docs.elementAt(
                                                      index)['detail'],
                                                  softWrap: true,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Text(
                                                  snapshot.data!.docs.elementAt(
                                                      index)['detail'],
                                                  softWrap: true,
                                                  overflow: TextOverflow.fade,
                                                ),
                                              ),
                                              */
                                              Container(
                                                child: Image.network(
                                                  snapshot.data!.docs.elementAt(
                                                      index)['images'],
                                                  fit: BoxFit.fill,
                                                  width: 250,
                                                  height: 300,
                                                ),
                                              ),
                                            
                                            
                                            */
                                            ],
                                          ),

                                         
                                         
                                         */
                                          builder: (_, collapsed, expanded) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 10),
                                              child: Expandable(
                                                collapsed: collapsed,
                                                expanded: expanded,
                                                theme:
                                                    const ExpandableThemeData(
                                                        crossFadePoint: 0),
                                              ),
                                            );
                                          },

                                          //
                                        ),
                                      ),
                                    ),

/*

                                    child: ExpandablePanel(
                                      theme: const ExpandableThemeData(
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        tapBodyToCollapse: true,
                                      ),
                                      header: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    alignment: Alignment.center,
                                                    child: Image.network(
                                                      snapshot.data?.docs
                                                          .elementAt(
                                                              index)['images'],
                                                      width: 75,
                                                      height: 75,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Container(
                                                            width: 100,
                                                            child: Text(
                                                              snapshot.data?.docs
                                                                      .elementAt(
                                                                          index)[
                                                                  'title'],
                                                              softWrap: true,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'THSarabunNew',
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: const Color(
                                                                    0xFF0C0C0C),
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'วันที่ ',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'THSarabunNew',
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: const Color(
                                                                      0xFF525252),
                                                                ),
                                                              ),
                                                              Text(
                                                                snapshot.data?.docs
                                                                        .elementAt(
                                                                            index)[
                                                                    'datetime'],
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'THSarabunNew',
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: const Color(
                                                                      0xFF525252),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      /*
                                      collapsed: Text(
                                        snapshot.data.documents
                                            .elementAt(index)['detail'],
                                        softWrap: true,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      */

                                      //show detail
                                      /*
                                      collapsed: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          snapshot.data.documents
                                              .elementAt(index)['detail'],
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      */

                                      //detail
                                      expanded: Column(
                                        children: <Widget>[
                                          /*
                                          Padding(padding: EdgeInsets.all(10),
                                          child: Text(
                                            snapshot.data
                                                .documents
                                                .elementAt(
                                                index)[
                                            'title'],
                                            softWrap: true,
                                            overflow:
                                            TextOverflow
                                                .ellipsis,
                                            style: TextStyle(
                                              fontFamily:
                                              'THSarabunNew',
                                              fontSize: 20,
                                              fontWeight:
                                              FontWeight
                                                  .bold,
                                              color: const Color(
                                                  0xFF0C0C0C),
                                            ),
                                          ),
                                          ),
                                          */
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              snapshot.data?.docs
                                                  .elementAt(index)['detail'],
                                              softWrap: true,
                                              overflow: TextOverflow.fade,
                                            ),
                                          ),
                                          Container(
                                            child: Image.network(
                                              snapshot.data?.docs
                                                  .elementAt(index)['images'],
                                              width: 125,
                                              height: 150,
                                            ),
                                          ),
                                        ],
                                      ),

                                      builder: (_, collapsed, expanded) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10, bottom: 10),
                                          child: Expandable(
                                            collapsed: collapsed,
                                            expanded: expanded,
                                            theme: const ExpandableThemeData(
                                                crossFadePoint: 0),
                                          ),
                                        );
                                      },
                                    ),
                                  
                                  */
                                  ),
                                ],
                              ),
                            ),
                          ));
                       
                       
                       */

                          //
                          return ExpandableNotifier(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: ExpansionTileCard(
                                /*
                                leading: CircleAvatar(child: const Text('FT')),

*/

//
                                /*
                                title: Text(
                                  'หัวข้อข่าว',
                                  //style: StyleProjects().H10style,
                                  textAlign: TextAlign.start,
                                  style: StyleProjects().TopicMain8,
                                ),

                                */

                                title: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    children: [
                                      /*
                                      Text(
                                        snapshot.data?.docs
                                            .elementAt(index)['title'],
                                        softWrap: true,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: StyleProjects().TopicMain8,
                                      ),
                                     
                                     */
                                      Container(
                                        width: 200,
                                        //padding: EdgeInsets.only(left: 10),
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          snapshot.data!.docs
                                              .elementAt(index)['title'],
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: StyleProjects().TopicMain8,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                subtitle: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'วันที่ : ',
                                        textAlign: TextAlign.start,
                                        style: StyleProjects().TopicMain8,
                                      ),
                                      Text(
                                        snapshot.data?.docs
                                            .elementAt(index)['datetime'],
                                        softWrap: true,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: StyleProjects().TopicMain8,
                                      ),
                                    ],
                                  ),
                                ),

                                //
                                children: <Widget>[
                                  Divider(
                                    thickness: 1.0,
                                    height: 1.0,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),
                                      /*
                                      child: Text(
                                        snapshot.data!.docs
                                            .elementAt(index)['detail'],
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        textAlign: TextAlign.start,
                                        style: StyleProjects().TopicMain8,
                                      ),
                                      */

                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              snapshot.data!.docs
                                                  .elementAt(index)['title'],
                                              softWrap: true,
                                              overflow: TextOverflow.fade,
                                              textAlign: TextAlign.start,
                                              style: StyleProjects().TopicMain8,
                                            ),
                                          ),
                                          StyleProjects().boxSpace1,
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              snapshot.data!.docs
                                                  .elementAt(index)['detail'],
                                              softWrap: true,
                                              overflow: TextOverflow.fade,
                                              textAlign: TextAlign.start,
                                              style: StyleProjects().TopicMain8,
                                            ),
                                          ),
                                          StyleProjects().BoxSpace,
                                          Container(
                                            alignment: Alignment.center,
                                            child: Image.network(
                                              snapshot.data?.docs
                                                  .elementAt(index)['images'],
                                              fit: BoxFit.fill,
                                              width: 250,
                                              height: 300,
                                            ),
                                          ),
                                        ],
                                      ),

                                      //
                                    ),
                                  ),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.spaceAround,
                                    buttonHeight: 52.0,
                                    buttonMinWidth: 90.0,
                                    children: <Widget>[
                                      TextButton(
                                        onPressed: () {},
                                        child: Column(
                                          children: <Widget>[
                                            Icon(Icons.arrow_upward),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2.0),
                                            ),
                                            //Text('Close'),
                                            Text(
                                              'ปิด',
                                              textAlign: TextAlign.start,
                                              style: StyleProjects().TopicMain8,
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Column(
                                          children: <Widget>[
                                            Icon(Icons.share_outlined),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2.0),
                                            ),
                                            //Text('Close'),
                                            Text(
                                              'แชร์',
                                              textAlign: TextAlign.start,
                                              style: StyleProjects().TopicMain8,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),

                                  /*
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.collapse();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.toggleExpansion();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.swap_vert),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Toggle'),
                        ],
                      ),
                    ),
                  ],
                ),
             
             */
                                ],

                                //
                              ),
                            ),

                            //
                          );

                          //
                        });
                  },
                ),
              ),
            ],
          ),
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
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffc52e),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget headertdvp1() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/logo.png'),
          ),
          SizedBox(
            width: 10,
          ),
          Center(
            child: Text(
              'โรงพิมพ์อาสารักษาดินแดน กรมการปกครอง\n'
              'Territorial Defence Volunteers Printing',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffc52e),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
