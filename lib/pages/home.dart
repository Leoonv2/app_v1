import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:app_v1/handlers/BScan.dart'; 
import 'package:app_v1/handlers/Product.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key); 

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var protein = 0;
  var carbs = 0;
  var calories = 0;

  var proteinGoal = 150;
  var carbsGoal = 200;
  var caloriesGoal = 2500; 
  
  //TODO: Make Config tab to set goals

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('MacroTrack')), 
        backgroundColor: const Color.fromARGB(255, 37, 37, 37), 
      ),
      body: const Center( 
        child: Text('Home Page'), 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: SvgPicture.asset('assets/icons/barcode.svg'),
          onPressed: () {
            // var barcode = Scanner().scanBarcode();
            var barcode = '4001686750063';
            Product().registerProduct(barcode.toString());
          },
          color: Colors.white,
        ),

      ),
      
    );
  }
}