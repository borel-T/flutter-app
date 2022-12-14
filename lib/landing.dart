import 'package:flutter/material.dart';
import "./search.dart";
import "./home.dart";
import "./chat.dart";
import "./drawerContent.dart";

class Landing extends StatelessWidget {
  const Landing({super.key});

  static const String _title = 'Fan is fun';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State {
  // tab bar index
  int _selectedIndex = 0;

  // chosen option style
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

// tab list
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    SearchScreen(),
    Chat(),
  ];

// method : handle item tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fan is fun'),
        backgroundColor: Colors.orange,
        actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.menu))],
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: MyDrawerContent(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.video_call),
          //   label: 'Live',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
