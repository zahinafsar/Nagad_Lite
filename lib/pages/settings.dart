import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final pin = TextEditingController();

  void setPin(String pinNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('counter', pinNumber);
    pin.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: TextField(
                controller: pin,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Set Pin",
                ),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setPin(pin.text);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                minimumSize: Size(double.infinity, 40),
              ),
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
