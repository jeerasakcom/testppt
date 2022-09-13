import 'package:flutter/material.dart';
import 'package:modprinting/components/admin/services/adminservice.dart';
import 'package:modprinting/components/customer/customerservice/cust_service.dart';
import 'package:modprinting/components/guest/Authentication/authentication.dart';
import 'package:modprinting/components/guest/calendarpage/calendarpage.dart';
import 'package:modprinting/components/guest/catalogpage/catalogpage.dart';
import 'package:modprinting/components/guest/chatscreen/chatscreen.dart';
import 'package:modprinting/components/guest/contactpage/contactpage.dart';
import 'package:modprinting/components/guest/contactpage/locationpage.dart';
import 'package:modprinting/components/guest/contactpage/socialscreen.dart';
import 'package:modprinting/components/guest/datacorporation/datacorporation.dart';
import 'package:modprinting/components/guest/evaluatepage/evaluatepage.dart';
import 'package:modprinting/components/guest/homescreen/homescreen.dart';
import 'package:modprinting/components/guest/infopage/infoscreen.dart';
import 'package:modprinting/components/guest/register/registerpages.dart';

final Map<String, WidgetBuilder> map = {
  '/home': (BuildContext context) => const HomePageDesign(),
  '/calendar': (BuildContext context) => const CalendarScreen(),
  '/contect': (BuildContext context) => ContactScreen(),
  '/location': (BuildContext context) => MapsPage(),
  '/sicial': (BuildContext context) => SocialPage(),
  '/bot': (BuildContext context) => ChatbotPage(), 
  '/datacorp': (BuildContext context) => DataCorporateScreen(),
  '/info': (BuildContext context) => InfotdvpScreen(),
  '/evaluate': (BuildContext context) => EvaluatePage(),
  '/catalog': (BuildContext context) => CatalogPage(),

  '/register': (BuildContext context) => RegisterNewCustomer(),
  '/authentication': (BuildContext context) => AuthenticationPage(),
  '/customerService': (BuildContext context) => CustomerService(),
  '/adminService': (BuildContext context) => AdminService(),
};
