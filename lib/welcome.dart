import 'package:flutter/material.dart';
import 'package:tuto_1/login.dart';
import 'package:tuto_1/signup.dart';
import 'package:tuto_1/support.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 100, right: 15),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 100,
                ),
                Container(
                  height: 20,
                ),
                const Text("Fan is Fun",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.orange)),
                Container(
                  height: 20,
                ),
                const Text(
                  "Connect and engage with your favorite teams",
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 80,
                ),
                Choice()
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class Choice extends StatelessWidget {
  const Choice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()))
                  },
              child: Text("Signup")),
          Container(height: 15),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()))
                  },
              child: Text("Login")),
          const SizedBox(height: 20),
          Divider(color: Colors.orange),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Support()))
                  },
              child: Text("Support/FAQ"))
        ],
      ),
    );
  }
}
