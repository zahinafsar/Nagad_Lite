import 'package:flutter/material.dart';
import '/services/home.dart';
import '/services/mobileRecharge.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
        routes: {
          '/': (context) => Home(),
          '/mobileRecharge': (context) => MobileRecharge(),
        },
      ),
    );
