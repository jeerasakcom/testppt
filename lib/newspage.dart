import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:modprinting/utility/stylepro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpansionTileCard Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: StyleProjects().backgroundState,
      ),
      home: MyHomePage(title: 'ExpansionTileCard Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        backgroundColor: StyleProjects().darkColor,
      ),
      body: ListView(
        children: <Widget>[
          StyleProjects().boxSpaceTop,
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
          StyleProjects().boxSpace1,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ExpansionTileCard(
              key: cardA,
              leading: CircleAvatar(child: Text('FT')),
              title: Text(
                'หัวข้อข่าว',
                //style: StyleProjects().H10style,
                textAlign: TextAlign.start,
                style: StyleProjects().TopicMain8,
              ),
              subtitle: // Text('I expand!'),
                  Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: 
                Row(
                  children: [
                    Text(
                      'วันที่ : ',
                      textAlign: TextAlign.start,
                      style: StyleProjects().TopicMain8,
                    ),

                    /*
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
                                                */
                  ],
                ),
              ),
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
                    child: Text(
                      """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.

Use me any time you think your app could benefit from being just a bit more Material.

These buttons control the next card down!""",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
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
              ],
            ),
          ),
          StyleProjects().boxSpaceTop2,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardB,
              expandedTextColor: Colors.red,
              leading: CircleAvatar(child: Text('B')),
              title: Text('Tap me!'),
              subtitle: Text('I expand, too!'),
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
                    child: Text(
                      """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.

Use me any time you think your app could benefit from being just a bit more Material.

These buttons control the card above!""",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.expand();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_downward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Open'),
                        ],
                      ),
                    ),
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
                        cardA.currentState?.toggleExpansion();
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
