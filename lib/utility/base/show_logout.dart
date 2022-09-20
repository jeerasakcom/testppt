import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modprinting/utility/base/show_logo.dart';
import 'package:modprinting/utility/base/show_text.dart';
import 'package:modprinting/utility/stylepro.dart';


class ShowLogout extends StatefulWidget {
  const ShowLogout({Key? key}) : super(key: key);

  @override
  _ShowLogoutState createState() => _ShowLogoutState();
}

class _ShowLogoutState extends State<ShowLogout> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: ListTile(
              leading: ShowLogo(),
              title: ShowTextNew(
                label: 'คุณต้องการออกจากระบบหรือไม่?',
                textStyle: StyleProjects().TextAlertH1Style,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.pushNamedAndRemoveUntil(
                          context, StyleProjects.routeAuthen, (route) => false));
                },
                child: const Text('Sign Out'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
      icon: const Icon(Icons.exit_to_app),
    );
  }
}
