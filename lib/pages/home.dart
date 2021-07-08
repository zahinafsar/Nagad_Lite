import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:ussd/ussd.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> routes = ["/", "/settings"];

  @override
  Widget build(BuildContext context) {
    changeLocation(String path) {
      Navigator.pushNamed(context, path);
    }

    Future<void> launchUssd(String ussdCode) async {
      Ussd.runUssd(ussdCode);
    }

    void checkBalance() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? pin = prefs.getString('counter');
      launchUssd("*167*7*1*$pin#");
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // title: Text(
          //   'Nogod Lite',
          //   style: TextStyle(
          //     fontSize: 35.0,
          //     fontFamily: 'Fantasy',
          //   ),
          // ),
          title: Image(
            image: AssetImage('assets/nagad_lite.png'),
            height: 50,
          ),
          // centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Colors.red,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.all(24),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                onPressed: () {
                  checkBalance();
                },
                label: Text('Balance'),
                icon: Icon(
                  Icons.monetization_on_outlined,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceCard(
                    title: 'Mobile Recharge',
                    goTo: () {
                      changeLocation('/mobileRecharge');
                    },
                    icon: Icons.mobile_screen_share,
                  ),
                  ServiceCard(
                    title: 'Send Money',
                    goTo: () {
                      changeLocation('/sendMoney');
                    },
                    icon: Icons.cloud_upload_outlined,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceCard(
                    title: 'Add Money',
                    goTo: () {
                      changeLocation('/');
                    },
                    icon: Icons.add_to_home_screen_rounded,
                    available: false,
                  ),
                  ServiceCard(
                    title: 'Pay Bill',
                    goTo: () {
                      changeLocation('/payBill');
                    },
                    icon: Icons.local_shipping_rounded,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceCard(
                    title: 'Donation',
                    goTo: () {
                      changeLocation('/');
                    },
                    icon: Icons.health_and_safety_sharp,
                    available: false,
                  ),
                  ServiceCard(
                    title: 'Income Tex',
                    goTo: () {
                      changeLocation('/');
                    },
                    icon: Icons.queue_play_next_outlined,
                    available: false,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceCard(
                    title: 'Cash Out',
                    goTo: () {
                      changeLocation('/cashOut');
                    },
                    icon: Icons.send_to_mobile_outlined,
                  ),
                  ServiceCard(
                    title: 'Merchant pay',
                    goTo: () {
                      changeLocation('/');
                    },
                    icon: Icons.swap_horizontal_circle_sharp,
                    available: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final Function goTo;
  final IconData icon;
  final bool available;
  ServiceCard(
      {required this.title,
      required this.icon,
      required this.goTo,
      this.available = true});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            goTo();
          },
          style: ElevatedButton.styleFrom(
            primary: available ? Colors.red[600] : Colors.grey[400],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
