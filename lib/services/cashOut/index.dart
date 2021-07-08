import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:ussd/ussd.dart';

class CashOut extends StatefulWidget {
  const CashOut({Key? key}) : super(key: key);

  @override
  _CashOutState createState() => _CashOutState();
}

class _CashOutState extends State<CashOut> {
  final useNumber = new TextEditingController();
  final useAmount = new TextEditingController();
  final usePin = new TextEditingController();

  Future<void> launchUssd() async {
    Ussd.runUssd("*167*1*${useNumber.text}*${useAmount.text}*${usePin.text}#");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Cash Out"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: useNumber,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Uddokta Number",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: useAmount,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Amount",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: usePin,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Pin",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launchUssd();
        },
        child: const Icon(Icons.arrow_forward_sharp),
        backgroundColor: Colors.red,
      ),
    );
  }
}
