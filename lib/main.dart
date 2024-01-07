import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {

    super.initState();  
  }

  @override
  void dispose() {
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromRGBO(25, 25, 25, 1.0),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('MacroTrack'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.qr_code_scanner),
          onPressed: () {
            print('Scanning');
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.barcode_reader),
              label: 'Scan'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings'
            ),
            
          ]
        ),
      ),
    );
  }
}
