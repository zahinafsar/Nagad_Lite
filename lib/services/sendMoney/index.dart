import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:ussd/ussd.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final useNumber = new TextEditingController();
  final useAmount = new TextEditingController();
  final useRef = new TextEditingController();
  final usePin = new TextEditingController();

  Future<void> launchUssd() async {
    Ussd.runUssd(
        "*167*2*${useNumber.text}*${useAmount.text}*${useRef.text}*${usePin.text}#");
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getInt('pin'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Send Money"),
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
                labelText: "Number",
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
              controller: useRef,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Reference",
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
