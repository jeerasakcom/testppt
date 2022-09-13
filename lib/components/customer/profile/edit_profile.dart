import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modprinting/components/customer/customerservice/customer_profile.dart';
import 'package:modprinting/models/users_model.dart';
import 'package:modprinting/utility/dialog.dart';
import 'package:modprinting/utility/stylepro.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserModel? userModel;
  //String? CustomerProfile, uid, address, phone;
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
    // TODO: implement initState
    super.initState();
    readProfile();
  }

  Future<Null> readProfile() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        token = event!.uid;
        //uid = event!.uid;
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => uploadValueToFirebase(),
          child: Icon(Icons.cloud_upload),
        ),
        appBar: AppBar(
          title: Text('Edit Profile'),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: StyleProjects().backgroundState,
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      StyleProjects().boxSpaceTop,
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
                      StyleProjects().boxSpaceTop2,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<Null> uploadValueToFirebase() async {
    if ((address?.isEmpty ?? true) || (phone?.isEmpty ?? true)) {
      normalDialog(
        context,
        'Have Space ?',
      );
    } else {
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
      );

      Map<String, dynamic> map = model.toMap();

      await Firebase.initializeApp().then((value) async {
        await FirebaseFirestore.instance
            .collection('profile')
            .doc()
            .set(map)
            .then((value) => Navigator.pop(context));
      });
    }
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
}
