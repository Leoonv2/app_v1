import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Add this line

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key); // Add the 'key' named parameter

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('MacroTrack')), // Add the 'const' keyword
        backgroundColor: const Color.fromARGB(255, 37, 37, 37), // Add the 'const' keyword
      ),
      body: const Center( // Add the 'const' keyword
        child: Text('Home Page'), // Add the 'const' keyword
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: SvgPicture.asset('assets/icons/barcode.svg'),
          onPressed: () {},
          color: Colors.white,
        ),
      ),
    );
  }
}