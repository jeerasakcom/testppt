

/*
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modprinting/models/user_model.dart';
import 'package:modprinting/utility/dialog.dart';
import 'package:modprinting/utility/stylepro.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class AddNewsPage extends StatefulWidget {
  @override
  _AddNewsPageState createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  File? file;
  String? level = 'admin';
  String? images, fname, lname, address, department, phone, email, password, token;


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
              image: AssetImage("assets/images/bg103.jpg"),
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
                    borderRadius: BorderRadius.circular(8)),
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
                        'เพิ่มผู้ดูแลระบบ',
                        style: StyleProjects().H2style,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: blockAvartar(),
                    ),
                    StyleProjects().boxSpaceTop2,
                    blockfname(),
                    blocklname(),
                    blockdepartment(),
                    blockphone(),
                    blockemail(),
                    blockPassword(),
                    blockAddNewsPage(),
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
          width: 100,
          height: 100,
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

  Container blockdepartment() => Container(
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
            labelText: "ฝ่าย :",
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
        phone: phone,
        email: email,
        password: password,
        images: images,
        token: token);

    Map<String, dynamic> map = model.toJson();

    await FirebaseFirestore.instance.collection('Users').doc(uid).set(map).then(
        (value) => //Navigator.pop(context)
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddNewsPage())));
  }

  Container blockAddNewsPage() => Container(
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
                phone == null ||
                phone!.isEmpty ||
                email == null ||
                email!.isEmpty ||
                password == null ||
                password!.isEmpty) {
              normalDialog(context, 'กรุณากรอก ทุกช่อง คะ');
            } else {
              print(
                  'fname = $fname, lname = $lname, level=$level,phone = $phone, email = $email, password = $password');
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

*/



import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:modprinting/models/news_model.dart';
import 'package:modprinting/utility/stylepro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
//time
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class AddNewsPages extends StatefulWidget {
  @override
  _AddNewsPagesState createState() => _AddNewsPagesState();
}

class _AddNewsPagesState extends State<AddNewsPages> {
  File? file;
  String? id,titlenews, detailnews, newsDateTime, timestamps, images;
  /*
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  final format = DateFormat("dd-MM-yyyy HH:mm");
  DateTime timestamp;
  */

  //use true
  DateTime _dueDate = DateTime.now();
  DateTime dateNow = DateTime.now();
  String _dateText = '';

  Future<Null> _selectDueDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        _dueDate = picked;
        //_dateText = "${picked.day}/${picked.month}/${picked.year}";
        newsDateTime = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //_dateText = "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";
    newsDateTime =
        "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}  :  ${dateNow.hour}:${dateNow.minute}:${dateNow.second}";
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          height: height,
          child: Column(
            children: [
              StyleProjects().boxSpaceTop2,
              StyleProjects().header4(),
              StyleProjects().boxSpaceTop2,
              blockheader(),
              SizedBox(
                height: 10,
              ),
              blockTitleNews(),
              SizedBox(
                height: 10,
              ),
              blockContentsNews(),
              SizedBox(
                height: 10,
              ),
              //blocktime(),
              //blockdate(),

              /*
              blockdatenews(),
              SizedBox(
                height: 10,
              ),
              */
              blockImg(),
              blockSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget blockheader() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'เพิ่มข่าวสารใหม่',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF0FF0B3),
              //color: const Color(0xFFFAD961),
              color: const Color(0xff000f3b),
            ),
          ),
        ],
      ),
    );
  }

  Widget blockTitleNews() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      //padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'หัวข้อข่าว',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
            ],
          ),
          TextFormField(
            maxLines: 2,
            minLines: 1,
            onChanged: (value) => titlenews = value.trim(),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xff000f3b),
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              /*
              hintText:
                  "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
            */
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget blockContentsNews() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'รายละเอียด',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
            ],
          ),
          TextFormField(
            maxLines: 5,
            minLines: 2,
            onChanged: (value) => detailnews = value.trim(),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xff000f3b),
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              /*
              hintText:
                  "Lorem Ipsum คือ เนื้อหาจำลองแบบเรียบๆ ที่ใช้กันในธุรกิจงานพิมพ์หรืองานเรียงพิมพ์ มันได้กลายมาเป็นเนื้อหาจำลองมาตรฐานของธุรกิจดังกล่าวมาตั้งแต่ศตวรรษที่ 16 เมื่อเครื่องพิมพ์โนเนมเครื่องหนึ่งนำรางตัวพิมพ์มาสลับสับตำแหน่งตัวอักษรเพื่อทำหนังสือตัวอย่าง Lorem Ipsum อยู่ยงคงกระพันมาไม่ใช่แค่เพียงห้าศตวรรษ แต่อยู่มาจนถึงยุคที่พลิกโฉมเข้าสู่งานเรียงพิมพ์ด้วยวิธีทางอิเล็กทรอนิกส์ และยังคงสภาพเดิมไว้อย่างไม่มีการเปลี่ยนแปลง มันได้รับความนิยมมากขึ้นในยุค ค.ศ. 1960 เมื่อแผ่น Letraset วางจำหน่ายโดยมีข้อความบนนั้นเป็น Lorem Ipsum และล่าสุดกว่านั้น คือเมื่อซอฟท์แวร์การทำสื่อสิ่งพิมพ์ (Desktop Publishing) อย่าง Aldus PageMaker ได้รวมเอา Lorem Ipsum เวอร์ชั่นต่างๆ เข้าไว้ในซอฟท์แวร์ด้วย",
            */
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

/*
  Widget blockdate() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Text(
                'วันที่ประกาศ',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.calendar_today,
                color: Color(0xff000f3b),
                size: 28,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                dateFormat.format(DateTime.now()),
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
            ],
          ),
        ],

        /*
        children: <Widget>[
          Text(
            'วันที่ประกาศ',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xff000f3b),
            ),
          ),
          Icon(
            Icons.calendar_today,
            color: Color(0xff000f3b),
            size: 28,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            dateFormat.format(DateTime.now()),
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xff000f3b),
            ),
          ),
        ],
      */
      ),
    );
  }

  Widget blocktime() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          DateTimeField(
            format: format,
            onSaved: (val) => setState(() => timestamp = val),
            keyboardType: TextInputType.datetime,
            onChanged: (DateTime newValue) {
              setState(() {
                timestamp = newValue;
              });
            },
            onShowPicker: (context, currentValue) async {
              final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                return DateTimeField.combine(date, time);
              } else {
                return currentValue;
              }
            },
          ),
        ],
      ),
    );
  }

*/
  Widget blockdatenews() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Text(
                'วันที่ประกาศ',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () => _selectDueDate(context),
                child: Text(
                  //_dateText,
                  newsDateTime!,
                  style: TextStyle(
                    fontFamily: 'THSarabunNew',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff000f3b),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget blockImg() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'ภาพข่าว',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff000f3b),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  color: const Color(0xff000f3b),
                ),
                onPressed: () => chooseImage(ImageSource.camera),
              ),
              Container(
                width: 150,
                height: 150,
                child: file == null
                    ? Image.asset(
                        'assets/images/newspic002.jpg',
                      )
                    : Image.file(file!),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_photo_alternate,
                  color: const Color(0xff000f3b),
                ),
                onPressed: () => chooseImage(ImageSource.gallery),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget blockSaveButton() {
    return Container(
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        //color: const Color(0xFF32A54F),
        color: const Color(0xFF459522),
        child: Text(
          "บันทึก",
          style: TextStyle(
            fontFamily: 'THSarabunNew',
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: const Color(0xffffffff),
          ),
        ),
        onPressed: () {
          if (file == null) {
            normalDialog(context, 'กรุณาเลือก รูปภาพด้วย คะ');
          } else if (titlenews == null ||
              titlenews!.isEmpty ||
              newsDateTime == null ||
              newsDateTime!.isEmpty ||
              detailnews == null ||
              detailnews!.isEmpty) {
            normalDialog(context, 'กรุณากรอก ทุกช่อง คะ');
          } else {
            uploadPicture();
            Navigator.of(context).pop();
            /*
            uploadPicture();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListNewsPage2(),
              ),
            );
            */
          }
        },
      ),
    );
  }

  

  Future<Null> uploadPicture() async {
    Random random = Random();
    int i = random.nextInt(100000);
    String namePic = 'news$i.jpg';

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference storageReference = firebaseStorage.ref().child('news/$namePic');
    UploadTask storageUploadTask = storageReference.putFile(file!);
    await (await storageUploadTask).ref.getDownloadURL().then((value) {
      images = value;
      print('images = $images');
      insertNews();
    });
  }




  Future<Null> insertNews() async {
    NewsModel model = NewsModel(
      //id: id,
      title: titlenews,
      detail: detailnews,
      images: images,
      newsDateTime: newsDateTime,
    );

    Map<String, dynamic> map = model.toJson();

    //await
    FirebaseFirestore.instance
        .collection('News')
        .doc()
        .set(map)
        .then((value) => Navigator.pop(context));
  }

  Future<Null> chooseImage(ImageSource imageSource) async {
    var result = await ImagePicker().pickImage(
      source: imageSource,
      maxWidth: 800,
      maxHeight: 800,
    );
    file = File(result!.path);
    setState(() {});
  }

  Row imageGroup() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
              color: const Color(0xff000f3b),
            ),
            onPressed: () => chooseImage(ImageSource.camera),
          ),
          Container(
            width: 150,
            height: 150,
            child: file == null
                ? Image.asset(
                    'assets/images/newspic002.jpg',
                  )
                : Image.file(file!),
          ),
          IconButton(
            icon: Icon(
              Icons.add_photo_alternate,
              color: const Color(0xff000f3b),
            ),
            onPressed: () => chooseImage(ImageSource.gallery),
          ),
        ],
      );

  Future<Null> normalDialog(BuildContext context, String string) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(string),
        children: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'ตกลง',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                //color: const Color(0xff000f3b),
                color: const Color(0xffda0641),
              ),
            ),
          )
        ],
      ),
    );
  }
}
