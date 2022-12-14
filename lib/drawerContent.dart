import 'package:flutter/material.dart';
import 'package:tuto_1/chat.dart';
import "./search.dart";
import './home.dart';

class MyDrawerContent extends StatelessWidget {
  const MyDrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Center(
              child: Text(
                "Fan is Fun",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )),
        ListTile(
          leading: Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            // to push to other pages
            //https://www.youtube.com/watch?v=17FLO6uHhHU&ab_channel=JohannesMilke
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Home()),
            );
            // now i pop to close
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.search),
          title: const Text('Search'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
            // now i pop to close
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.chat),
          title: const Text('Chat'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Chat()),
            );
            // now i pop to close
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
