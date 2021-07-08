import 'package:flutter/material.dart';
import 'package:nogod_lite/services/cashOut/index.dart';
import 'package:nogod_lite/services/mobileRecharge/index.dart';
import 'package:nogod_lite/services/payBill/index.dart';
import 'package:nogod_lite/services/payBill/subServices/electricity.dart';
import 'package:nogod_lite/services/sendMoney/index.dart';
import '/App.dart';

void main() => runApp(
      MaterialApp(
        home: App(),
        routes: {
          '/mobileRecharge': (context) => MobileRecharge(),
          '/sendMoney': (context) => SendMoney(),
          '/cashOut': (context) => CashOut(),
          '/payBill': (context) => PayBill(),
          // paybill sub options
          '/electricity': (context) => Electricity(),
        },
      ),
    );
