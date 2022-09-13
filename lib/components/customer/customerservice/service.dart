



/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/components/customer/customerservice/customer_profile.dart';
import 'package:infrastructure/components/guest/register/registerpages.dart';
import 'package:infrastructure/models/user_model.dart';


class CustomerService extends StatefulWidget {
  @override
  _CustomerServiceState createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  UserModel? userModel;
  Widget currentWidget = CustomerProfilePage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  buildUserAccountsDrawerHeader(),
                  buildListTileCustomerProfilePage(),
                  buildListTilePage2(),
                ],
              ),
            ),
            buildSignOut(),
          ],
        ),
      ),
      body: currentWidget,
    );
  }

  ListTile buildListTileCustomerProfilePage() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = CustomerProfilePage();
        });
      },
      leading: Icon(Icons.account_balance),
      title: Text('Bar Code'),
      subtitle: Text('Read, Search and Add Bar Code'),
    );
  }

  ListTile buildListTilePage2() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
      },
      leading: Icon(Icons.filter_2),
      title: Text('Page 2'),
      subtitle: Text('Show Page 2'),
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/img00100.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      currentAccountPicture: userModel == null
          ? Image.asset('assets/images/avatar.png')
          : CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(userModel.images),
            ),
      accountName: Row(
        children: [
          Text(
            'คุณ',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            userModel == null ? 'fname' : userModel.fname,
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
      accountEmail: Row(
        children: [
          Text(
            'อีเมล',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            userModel == null ? 'email' : userModel.email,
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }

  Column buildSignOut() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.red.shade700),
          child: ListTile(
            onTap: () async {
              await Firebase.initializeApp().then((value) async {
                await FirebaseAuth.instance
                    .signOut()
                    .then((value) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterNewCustomer(),
                        ),
                        (route) => false));
              });
            },
            leading: Icon(
              Icons.exit_to_app,
              size: 36,
              color: Colors.white,
            ),
            title: Text(
              'ออกจากระบบ',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> findUserLogin() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        String uid = event!.uid;
        print('uid ===>> $uid');
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .snapshots()
            .listen((event) {
          setState(() {
            userModel = UserModel.fromJson(event.data());
          });
        });
      });
    });
  }
}


*/