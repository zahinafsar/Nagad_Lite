import 'package:flutter/material.dart';
import 'package:nogod_lite/services/sendMoney.dart';
import '/App.dart';
import '/services/mobileRecharge.dart';

void main() => runApp(
      MaterialApp(
        home: App(),
        routes: {
          '/mobileRecharge': (context) => MobileRecharge(),
          '/sendMoney': (context) => SendMoney(),
        },
      ),
    );
