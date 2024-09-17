import 'package:flutter/material.dart';
import 'package:proyekflutter/pages/home.dart'; 
import 'package:proyekflutter/pages/menu.dart'; 
import 'package:proyekflutter/pages/creator.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Aplikasi To-Do List Sederhana',
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Color(0xFFDF6E21), 
          secondary: Color(0xFF351C4D), 
          surface: Colors.white, 
          error: Colors.red,
          onPrimary: Colors.black,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF351C4D), 
          foregroundColor: Colors.white, 
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF351C4D), 
          selectedItemColor: Color(0xFFDF6E21), 
          unselectedItemColor: Colors.white70, 
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFFDF6E21), 
          textTheme: ButtonTextTheme.primary, 
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: {
        '/menu': (context) => Menu(),
        '/creator': (context) => Creator(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(), 
    Menu(), 
    Creator(), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Creator',
          ),
        ],
      ),
    );
  }
}
