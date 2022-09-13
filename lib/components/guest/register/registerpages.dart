import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modprinting/components/guest/Authentication/authentication.dart';
import 'package:modprinting/models/user_model.dart';
import 'package:modprinting/utility/dialog.dart';
import 'package:modprinting/utility/stylepro.dart';
import 'package:firebase_messaging/firebase_messaging.dart';






class RegisterNewCustomer extends StatefulWidget {
  @override
  _RegisterNewCustomerState createState() => _RegisterNewCustomerState();
}

class _RegisterNewCustomerState extends State<RegisterNewCustomer> {
  File? file;
  String? level = 'customer';
  String? images,
      fname,
      lname,
      address,
      subdistrict,
      district,
      province,
      zipcode,
      phone,
      email,
      password,
      rePassword,
      token;

  @override
  void initState() {
    super.initState();
    findToken();
  }

  Future<void> findToken() async {
    await FirebaseMessaging.instance.getToken().then((value) {
      token = value;
      print('token = $token');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg400.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              StyleProjects().boxSpaceTop,
              _backButton(),
              StyleProjects().boxSpaceTop2,
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 1,
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    StyleProjects().boxSpaceTop,
                    StyleProjects().header1(),
                    StyleProjects().boxSpaceTop2,
                    //StyleProjects().headerReg(),
                    Center(
                      child: Text(
                        'สมัครสมาชิก',
                        style: StyleProjects().H2style,
                      ),
                    ),

                    StyleProjects().boxSpace2,

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: blockAvartar(),
                    ),

                    //
                    /*
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: [
                          blockfname(),
                          blocklname(),
                          blockaddress(),
                          blocksubdistrict(),
                          blockdistrict(),
                          blockprovince(),
                          blockzipcode(),
                          blockphone(),
                          blockemail(),
                          blockPassword(),
                          blockRePassword(),
                          blockRegisterNewCustomer(),
                        ],
                      ),
                    ),

                    */

                    /*
                    StyleProjects().boxSpaceTop2,
                    Column(                  
                      children: [
                        blockfname(),
                        blocklname(),
                        blockaddress(),
                        blocksubdistrict(),
                        blockdistrict(),
                        blockprovince(),
                        blockzipcode(),
                        blockphone(),
                        blockemail(),
                        blockPassword(),
                        blockRePassword(),
                        blockRegisterNewCustomer(),
                      ],
                    ),
*/
                    StyleProjects().boxSpaceTop2,

                    blockfname(),
                    blocklname(),
                    blockaddress(),
                    blocksubdistrict(),
                    blockdistrict(),
                    blockprovince(),
                    //blockzipcode(),
                    blockZipcodeNew(),
                    blockPhoneNew(),
                    //blockphone(),
                    blockemail(),
                    blockPassword(),
                    blockRePassword(),
                    blockRegisterNewCustomer(),
                    StyleProjects().boxSpaceTop2,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row blockAvartar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.add_a_photo,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () => chooseAvatar(ImageSource.camera),
        ),
        Container(
          width: 115,
          height: 115,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: file == null
                ? Image.asset('assets/images/avatar.png')
                : CircleAvatar(
                    backgroundImage: FileImage(file!),
                  ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.add_photo_alternate,
            color: Colors.white,
            size: 35,
          ),
          onPressed: () => chooseAvatar(ImageSource.gallery),
        ),
      ],
    );
  }

  Container blockPhoneNew() => Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          onChanged: (value) => phone = value.trim(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.phone_android_outlined,
              color: Colors.white,
            ),
            labelText: "เบอร์โทรศัพท์ : ",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 14, 98))),
          ),
        ),
      );

  Container blockZipcodeNew() => Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          onChanged: (value) => zipcode = value.trim(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.location_on_sharp,
              color: Colors.white,
            ),
            labelText: "รหัสไปรษณีย์ : ",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 14, 98))),
          ),
        ),
      );

  Container blockfname() => Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          onChanged: (value) => fname = value.trim(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.location_history_rounded,
              color: Colors.white,
            ),
            labelText: "ชื่อ : ",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 14, 98))),
          ),
        ),
      );

  Container blocklname() => Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          onChanged: (value) => lname = value.trim(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.location_history_rounded,
              color: Colors.white,
            ),
            labelText: "นามสกุล : ",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 14, 98))),
          ),
        ),
      );

  Container blockaddress() => Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          onChanged: (value) => address = value.trim(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            labelText: "ที่อยู่ :",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 14, 98))),
          ),
        ),
      );

  Container blocksubdistrict() => Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          onChanged: (value) => subdistrict = value.trim(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            labelText: "ตำบล : ",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 14, 98))),
          ),
        ),
      );

  Container blockdistrict() => Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          onChanged: (value) => district = value.trim(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            labelText: "อำเภอ : ",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 14, 98))),
          ),
        ),
      );

  Container blockprovince() => Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          onChanged: (value) => province = value.trim(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.location_city_sharp,
              color: Colors.white,
            ),
            labelText: "จังหวัด : ",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 14, 98))),
          ),
        ),
      );

  Container blockzipcode() => Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          maxLength: 5,
          onChanged: (value) => zipcode = value.trim(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.location_on_sharp,
              color: Colors.white,
            ),
            labelText: "รหัสไปรษณีย์ : ",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 14, 98))),
          ),
        ),
      );

  Container blockphone() => Container(
        //padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          maxLength: 10,
          onChanged: (value) => phone = value.trim(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.phone_android_outlined,
              color: Colors.white,
            ),
            labelText: "เบอร์โทรศัพท์ : ",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 14, 98))),
          ),
        ),
      );

  Container blockemail() => Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          onChanged: (value) => email = value.trim(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
            labelText: "Email :",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 14, 98))),
          ),
        ),
      );

  Container blockPassword() => Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            labelText: "Password :",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 14, 98))),
          ),
        ),
      );

  Container blockRePassword() => Container(
        margin: EdgeInsets.only(bottom: 16),
        width: 250,
        child: TextField(
          onChanged: (value) => rePassword = value.trim(),
          obscureText: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock_open,
              color: Colors.white,
            ),
            labelText: "Re-Password :",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white,
            )),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 255, 14, 98),
              ),
            ),
          ),
        ),
      );

  Future<Null> chooseAvatar(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      print('path ==>> ${result!.path}');
      setState(() {
        file = File(result.path);
      });
    } catch (e) {
      print('e chooseAvatar ==> ${e.toString()}');
    }
  }

  Future<Null> authenToFirebase() async {
    await Firebase.initializeApp().then(
      (value) async {
        print('Initial Success');
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!)
            .then((value) {
          String uid = value.user!.uid;
          uploadAvatarToFirebase(uid);
        }).catchError((value) {
          String error = value.message;
          normalDialog(context, error);
        });
      },
    );
  }

  Future uploadAvatarToFirebase(String uid) async {
    print('uid ==>> $uid');
    String nameAvatar = '$uid.jpg';

    String images = await (await FirebaseStorage.instance
            .ref()
            .child('Avatar/$nameAvatar')
            .putFile(file!))
        .ref
        .getDownloadURL();
    print('images = $images');
    insertDataToCloudFirestore(images, uid);
  }

  Future<Null> insertDataToCloudFirestore(String images, String uid) async {
    UserModel model = UserModel(
        fname: fname,
        lname: lname,
        level: level,
        address: address,
        subdistrict: subdistrict,
        district: district,
        province: province,
        zipcode: zipcode,
        phone: phone,
        email: email,
        password: password,
        images: images,
        token: token);

    Map<String, dynamic> map = model.toJson();

    await FirebaseFirestore.instance.collection('Users').doc(uid).set(map).then(
        (value) => //Navigator.pop(context)
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AuthenticationPage())));
  }

  Container blockRegisterNewCustomer() => Container(
        padding: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 6,
          child: Text(
            'ลงทะเบียน',
            style: StyleProjects().TopicMainT3_1,
          ),
          onPressed: () {
            if (file == null) {
              normalDialog(context, 'กรุณาเลือก รูปภาพด้วย คะ');
            } else if (fname == null ||
                fname!.isEmpty ||
                lname == null ||
                lname!.isEmpty ||
                address == null ||
                address!.isEmpty ||
                subdistrict == null ||
                subdistrict!.isEmpty ||
                district == null ||
                district!.isEmpty ||
                province == null ||
                province!.isEmpty ||
                zipcode == null ||
                zipcode!.isEmpty ||
                phone == null ||
                phone!.isEmpty ||
                email == null ||
                email!.isEmpty ||
                password == null ||
                password!.isEmpty ||
                rePassword == null ||
                rePassword!.isEmpty) {
              normalDialog(context, 'กรุณากรอก ทุกช่อง คะ');
            } else if (password != rePassword) {
              normalDialog(context, 'กรุณากรอก Password ให้เหมือนกันคะ');
            } else {
              print(
                  'fname = $fname, lname = $lname, level=$level, address = $address, subdistrict = $subdistrict, district = $district, province = $province, zipcode = $zipcode, phone = $phone, email = $email, password = $password, re-Password = $rePassword');
              authenToFirebase();
            }
          },
        ),
      );

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
}
