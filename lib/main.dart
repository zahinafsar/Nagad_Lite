import 'package:flutter/material.dart';
import '/services/home.dart';
import '/services/mobileRecharge.dart';
import '/services/loading.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/home',
        routes: {
          '/': (context) => Loading(),
          '/home': (context) => Home(),
          '/mobileRecharge': (context) => MobileRecharge(),
        },
      ),
    );
