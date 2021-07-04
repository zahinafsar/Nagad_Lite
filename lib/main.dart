import 'package:flutter/material.dart';
import '/App.dart';
import '/services/mobileRecharge.dart';

void main() => runApp(
      MaterialApp(
        home: App(),
        routes: {
          '/mobileRecharge': (context) => MobileRecharge(),
        },
      ),
    );
