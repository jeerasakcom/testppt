

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart' as lct;
import 'package:modprinting/utility/stylepro.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  static const LatLng centerMap = const LatLng(13.960564, 100.799599);

  Widget Map() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: centerMap,
        zoom: 15,
      ),
      onMapCreated: (GoogleMapController googleMapController) {},
      markers: TDVPMarker(),
    );
  }

  Set<Marker> TDVPMarker() {
    return <Marker>[
      Marker(
        position: centerMap,
        markerId: MarkerId('TDVPrint'),
        infoWindow: InfoWindow(
          title: "โรงพิมพ์อาสารักษาดินแดนกรมการปกครอง",
          snippet: "55/1 หมู่ 11 ต.บึงทองหลาง อ.ลำลูกกา จ.ปทุมธานี 12150",
        ),
      ),
    ].toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Maps',
          textAlign: TextAlign.center,
          style: StyleProjects().TopicMain1,
        ),
        //backgroundColor: const Color(0xff002040),
      ),


      //body: Map(),
      body: Container(
        child: Stack(
          children: <Widget>[

            Container(
              child: Map(),
            ),
            _tdvpbox(),
          ],
        ),
      ),
    );
  }

  Widget _tdvpbox() {
    return Align(
      alignment: Alignment.bottomLeft,
      //alignment: Alignment.bottomCenter,
      child: Card(

        //color: const Color(0xffb7c0d4),
        //color: const Color(0xfffefbfb),
        //color: const Color(0xff0095da),
        //color: const Color(0xff002040),
        color: const Color(0xff1461e7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        


        //
        elevation: 5,
        //margin: EdgeInsets.all(20),

        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Container(

          //
          /*
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg105.jpg"),
              fit: BoxFit.cover,
            ),
          ),
*/
          //

          height: 100,
          width: 280,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              Container(
                margin: EdgeInsets.all(10),

                child: Image.asset(
                  'assets/images/b11.jpg',
                  fit: BoxFit.cover,
                  height: 50,
                  width: 80,
                ),
              ),


              /*
              Expanded(child: Center(

                  child: Column(

                    children: <Widget>[
                      Text(
                        "โรงพิมพ์อาสารักษาดินแดน กรมการปกครอง",
                        textAlign: TextAlign.center,
                        style: StyleProjects().TopicMainT3_E,
                      ),
                      Text(
                        "55/1 หมู่11 ต.บึงทองหลาง อ.ลำลูกกา จ.ปทุมธานี 12150",
                        textAlign: TextAlign.center,
                        style: StyleProjects().TopicMainT3_E,
                      ),
                      Text(
                        "เวลาทำการ วันจันทร์-วันศุกร์ " "เวลา 08.00น.-17.00น.",
                        textAlign: TextAlign.center,
                        style: StyleProjects().TopicMainT3_E,
                      ),
                      Text(
                        "โทร. 0-2012-4170 ถึง 80",
                        textAlign: TextAlign.center,
                        style: StyleProjects().TopicMainT3_E,
                      ),
                    ],
                  )



              ),),

              Expanded(
                child: Container(
                  alignment: Alignment.center,



                    //

                    child: Column(

                      children: <Widget>[
                        Text(
                          "โรงพิมพ์อาสารักษาดินแดน กรมการปกครอง",
                          textAlign: TextAlign.center,
                          style: StyleProjects().TopicMainT3_E,
                        ),
                        Text(
                          "55/1 หมู่11 ต.บึงทองหลาง อ.ลำลูกกา จ.ปทุมธานี 12150",
                          textAlign: TextAlign.center,
                          style: StyleProjects().TopicMainT3_E,
                        ),
                        Text(
                          "เวลาทำการ วันจันทร์-วันศุกร์ " "เวลา 08.00น.-17.00น.",
                          textAlign: TextAlign.center,
                          style: StyleProjects().TopicMainT3_E,
                        ),
                        Text(
                          "โทร. 0-2012-4170 ถึง 80",
                          textAlign: TextAlign.center,
                          style: StyleProjects().TopicMainT3_E,
                        ),
                      ],
                    )

                //
                ),
              ),

              */

              //2

              Padding(padding: EdgeInsets.all(1),
                  child: Column(
                    children: <Widget>[
                      StyleProjects().BoxSpace,

                      Text(
                        "โรงพิมพ์อาสารักษาดินแดน กรมการปกครอง",
                        textAlign: TextAlign.center,
                        style: StyleProjects().TopicMainT3_F,
                      ),
                      Text(
                        "55/1 หมู่11 ต.บึงทองหลาง อ.ลำลูกกา จ.ปทุมธานี 12150",
                        textAlign: TextAlign.center,
                        style: StyleProjects().TopicMainT3_E,
                      ),
                      Text(
                        "เวลาทำการ วันจันทร์-วันศุกร์ " "เวลา 08.00น.-17.00น.",
                        textAlign: TextAlign.center,
                        style: StyleProjects().TopicMainT3_E,
                      ),
                      Text(
                        "โทร. 0-2012-4170 ถึง 80",
                        textAlign: TextAlign.center,
                        style: StyleProjects().TopicMainT3_E,
                      ),
                    ],
                  )),




              /*
              Expanded(
                  child: Column(

                    children: <Widget>[
                      StyleProjects().BoxSpace,

                      Text(
                        "โรงพิมพ์อาสารักษาดินแดน กรมการปกครอง",
                        textAlign: TextAlign.center,
                        style: StyleProjects().TopicMainT3_E,
                      ),
                      Text(
                        "55/1 หมู่11 ต.บึงทองหลาง อ.ลำลูกกา จ.ปทุมธานี 12150",
                        textAlign: TextAlign.center,
                        style: StyleProjects().TopicMainT3_E,
                      ),
                      Text(
                        "เวลาทำการ วันจันทร์-วันศุกร์ " "เวลา 08.00น.-17.00น.",
                        textAlign: TextAlign.center,
                        style: StyleProjects().TopicMainT3_E,
                      ),
                      Text(
                        "โทร. 0-2012-4170 ถึง 80",
                        textAlign: TextAlign.center,
                        style: StyleProjects().TopicMainT3_E,
                      ),
                    ],
                  )),

*/
              //
            ],
          ),
        ),
      ),
    );
  }

}






