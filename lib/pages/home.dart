import 'dart:ffi';

import 'dart:convert';
import 'package:app_v1/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_v1/handlers/Product.dart';
import 'package:app_v1/globals.dart' as globals;

import '../handlers/BScan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int caloriesLeft = 0;
  int proteinLeft = 0;
  int carbsLeft = 0;
  List<Map<String, dynamic>> eatenProducts = [];
  int count = 0;

  void addProduct(Map<String, dynamic> product) { // thx chatGPT to fix this function
    setState(() {
      int index = eatenProducts.indexWhere((item) =>
          item['name'] == product['name'] &&
          item['calories'] == product['calories'] &&
          item['protein'] == product['protein'] &&
          item['carbs'] == product['carbs']);
      if (index != -1) {
        print("contains product");
        eatenProducts[index].update("amount", (dynamic value) => (value as int) + 1);
      } else {
        print("does not contain product");
        product.addEntries( [MapEntry('amount', 1)].cast<MapEntry<String, Object>>() );
        eatenProducts.add(product);
      }
      updateMacros();
    });
  }

  void geteatenProducts() {
    setState(() {
      eatenProducts = globals.eatenProducts;
    });
  }

  @override
  void initState() {
    super.initState();
    updateMacros();
    geteatenProducts();
  }

  void updateCount() {
    setState(() {
      count = (count + 1) % 3;
    });
  }

  void updateMacros() {
    setState(() {
      caloriesLeft = globals.caloriesGoal - globals.eatenCalories;
      proteinLeft = globals.proteinGoal - globals.eatenProtein;
      carbsLeft = globals.carbsGoal - globals.eatenCarbs;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('MacroTrack')),
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              // ignore: unnecessary_brace_in_string_interps
              'You still need to eat\n${caloriesLeft} calories\n${proteinLeft} grams of protein\n${carbsLeft} grams of carbs\n',
            ),
            Expanded(
              child: ListView.builder(
                itemCount: eatenProducts.length,
                itemBuilder: (context, index) {
                  final product = eatenProducts[index];
                  // print(product);
                  return Card(
                    child: ListTile(
                      title: Text('${product['name']} (x${product['amount']})'),
                      subtitle: Text(product['amount'].toString()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        selectedItemColor: Colors.primaries[3],
        onTap: (index) {
          if (index == 2) {
            // switch to settings page

            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          icon: SvgPicture.asset('assets/icons/barcode.svg'),
          onPressed: () async {
            var barcode = Scanner().scanBarcode();

            var productData =
                await Product().getProduct(barcode);

            addProduct(jsonDecode(productData));
            // updateCount();
          },
          color: Colors.white,
        ),
      ),
    );
  }
}
