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
    Ussd.runUssd(
        "*167*5*1*${type.indexOf(typeValue) + 1}*${cardNo.text}*${genMonth(month.indexOf(monthValue))}$yearValue*${useAmount.text}*${usePin.text}#");
  }

  String genMonth(int data) {
    if ((data + 1).toString().length == 1) {
      return '0' + (data + 1).toString();
    } else {
      return (data + 1).toString();
    }
  }

  String typeValue = 'DPDC';
  var type = [
    'DPDC',
    'NESCO Post',
    'NESCO Pre',
    'DESCO Post',
    'WZPDC',
    'DESCO Pre',
  ];

  String monthValue = 'January';
  var month = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  String yearValue = '2021';
  var year = [
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
  ];

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
            InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                contentPadding: EdgeInsets.fromLTRB(13, 6, 13, 6),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: typeValue,
                  items: type.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      typeValue = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                contentPadding: EdgeInsets.fromLTRB(13, 6, 13, 6),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: monthValue,
                  items: month.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      monthValue = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                contentPadding: EdgeInsets.fromLTRB(13, 6, 13, 6),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: yearValue,
                  items: year.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      yearValue = value!;
                    });
                  },
                ),
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
