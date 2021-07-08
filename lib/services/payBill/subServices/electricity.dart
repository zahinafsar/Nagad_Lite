import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ussd/ussd.dart';

class Electricity extends StatefulWidget {
  const Electricity({Key? key}) : super(key: key);

  @override
  _ElectricityState createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> {
  final useAmount = new TextEditingController();
  final cardNo = new TextEditingController();
  final usePin = new TextEditingController();

  Future<void> launchUssd() async {
    // Ussd.runUssd(
    //   "*167*5*1*1*${useNumber.text}*${cardNo.text}*${useAmount.text}*${usePin.text}#"
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Electricity"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: cardNo,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Card Number",
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
