import 'package:flutter/material.dart';

class PayBill extends StatefulWidget {
  const PayBill({Key? key}) : super(key: key);

  @override
  _PayBillState createState() => _PayBillState();
}

class _PayBillState extends State<PayBill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay Bill"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  minimumSize: Size(double.infinity, 40),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/electricity');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Electricity'),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[400],
                  minimumSize: Size(double.infinity, 40),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Gas'),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[400],
                  minimumSize: Size(double.infinity, 40),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Internet'),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[400],
                  minimumSize: Size(double.infinity, 40),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Internet'),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
