import 'package:flutter/material.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({Key? key}) : super(key: key);

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body:  Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg850.jpg"),
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

                  SizedBox(
                    height: 100,
                  ),

                  Container(
                    margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      //color: const Color(0xfff0f7f9),
                      color: const Color(0xfffffdf9),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[

                        /*
                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(image:
                              AssetImage('assets/images/logo.png'),
                              ),
                              SizedBox(width: 10,),
                              Center(
                                child: Text(
                                  'โรงพิมพ์อาสารักษาดินแดน กรมการปกครอง\n''Territorial Defence Volunteers Printing',
                                  style: TextStyle(
                                    fontFamily: 'THSarabunNew',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff004080),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                         */

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
                                  'ตรวจสอบการจัดพิมพ์',
                                  style: TextStyle(
                                      fontFamily: 'THSarabunNew',
                                      color: const Color(0xff004080),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,),
                                ),
                              ),
                              SizedBox(height: 20,),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10.0,
                        ),

                        Container(
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.assignment_turned_in,
                                  color: Colors.black,
                                ),
                                labelText:"รหัสการสั่งพิมพ์ : ",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black,),),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pinkAccent),),
                              ),
                            )
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        ButtonCheck(),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),

      ),
    );
  }

  /*
  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)]
          )
      ),
      child: Text(
        'ตรวจสอบ',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

   */

  Widget ButtonCheck() {
    return Container(
      //padding: EdgeInsets.all(5),
      //margin: EdgeInsets.only(top: 5),
      //constraints: BoxConstraints.expand(height: 50),
      child: RaisedButton(
        color:  Colors.green,
        onPressed: () {},
        child: Text(
          'ตรวจสอบ',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
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
                color: const Color(0xffffffff),
              ),
            ),
            Text(
              'Back',
              style: TextStyle(
                fontFamily: 'TH Sarabun New',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff),
              ),
            )
          ],
        ),
      ),
    );
  }

}
