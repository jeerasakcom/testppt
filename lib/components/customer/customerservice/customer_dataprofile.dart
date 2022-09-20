import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modprinting/components/customer/profile/edit_profile.dart';
import 'package:modprinting/models/users_model.dart';
import 'package:modprinting/utility/base/show_image_avatar.dart';
import 'package:modprinting/utility/base/show_process.dart';
import 'package:modprinting/utility/base/show_text.dart';
import 'package:modprinting/utility/stylepro.dart';

class CustomerDataProfilePage extends StatefulWidget {
  const CustomerDataProfilePage({Key? key}) : super(key: key);

  @override
  State<CustomerDataProfilePage> createState() =>
      _CustomerDataProfilePageState();
}

class _CustomerDataProfilePageState extends State<CustomerDataProfilePage> {
  var user = FirebaseAuth.instance.currentUser;
  UserModel? userModel;
  bool load = true;

  @override
  void initState() {
    super.initState();
    readProfile();
  }

  Future<void> readProfile() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get()
        .then((value) {
      setState(() {
        load = false;
        userModel = UserModel.fromMap(value.data()!);
        print('userModel ==> ${userModel!.toMap()}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
        //backgroundColor: StyleProjects().backgroundState,
        //title: const Text('ข้อมูลส่วนตัว'),
      ),

      /*
      floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfile(
                    //userModel: userModel!,
                  ),
                )).then((value) {
              readProfile();
            });
          },
          child: const Text('Edit Profile')),
      

      */

//
/*
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.edit),
        label: Text('แก้ไขข้อมูล',style: StyleProjects().TopicMainT3_6,),
        backgroundColor: StyleProjects().baseColor,
      ),
      */

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfile(
                    //userModel: userModel!,
                    ),
              )).then((value) {
            readProfile();
          });
        },
        backgroundColor: Colors.amber,
        //backgroundColor: StyleProjects().baseColor,
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

      backgroundColor: StyleProjects().backgroundState,

      body: load
          ? const Center(child: ShowProcess())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StyleProjects().boxSpaceTop2,
                  Center(
                    child: Text(
                      'ข้อมูลลูกค้า',
                      style: StyleProjects().contentstyle1,
                    ),
                  ),
                  StyleProjects().boxSpaceTop2,
                  //
                  /*
                  AvatarView(
                    radius: 70,
                    borderWidth: 8,
                    // borderColor: Colors.yellow,
                   // borderColor: Color(0xff033674),
                   borderColor: Color(0xfff8d800),
                    avatarType: AvatarType.CIRCLE,
                    backgroundColor: Colors.red,
                    imagePath: userModel!.images!,
                    placeHolder: Container(
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    errorWidget: Container(
                      child: Icon(
                        Icons.error,
                        size: 50,
                      ),
                    ),
                  ),

                  //
                  AvatarView(
                    radius: 60,
                    borderColor: Colors.yellow,
                    isOnlyText: false,
                    text: Text(
                      'C',
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                    avatarType: AvatarType.CIRCLE,
                    backgroundColor: Colors.red,
                    imagePath: userModel!.images!,
                    placeHolder: Container(
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    errorWidget: Container(
                      child: Icon(
                        Icons.error,
                        size: 50,
                      ),
                    ),
                  ),

*/
                  //
                  ShowImageAvatar(
                    urlImage: userModel!.images!,
                    size: 75,
                  ),

                  //
                  StyleProjects().boxSpaceTop2,
                  newLabel(head: 'ชื่อ :', value: userModel!.fname!),
                  newLabel(head: 'นามสกุล :', value: userModel!.lname!),
                  newLabel(head: 'ที่อยู่ :', value: userModel!.address!),
                  newLabel(head: 'ตำบล :', value: userModel!.subdistrict!),
                  newLabel(head: 'อำเภอ :', value: userModel!.district!),
                  newLabel(head: 'จังหวัด :', value: userModel!.province!),
                  newLabel(head: 'รหัสไปรษณีย์ :', value: userModel!.zipcode!),
                  newLabel(head: 'เบอร์โทรศัพท์ :', value: userModel!.phone!),
                  newLabel(head: 'Email :', value: userModel!.email!),
                ],
              ),
            ),
    );
  }

  Row newLabel({required String head, required String value}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ShowTextNew(
            label: head,
            textStyle:
                StyleProjects().contentstyle2, //TopicMain11, //titleH4StyleK,
          ),
        ),
        Expanded(
          flex: 3,
          child: ShowTextNew(
            label: value,
            textStyle: StyleProjects().contentstyle2,
          ),
        ),
      ],
    );
  }
}
