import 'package:app_v1/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_v1/handlers/BScan.dart';
import 'package:app_v1/handlers/Product.dart';
import 'package:app_v1/globals.dart' as globals;

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

  void addProduct(product) {
    setState(() {
      eatenProducts.insert(eatenProducts.length, product);
      int index = eatenProducts.length;
      eatenProducts = eatenProducts.map((pr) {
        index--;
        return {...pr, "index": index};
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    updateMacros();
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

  //TODO: Make Config tab to set goals

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
            Text(eatenProducts.map((pr) {
              if (pr)
              int index = eatenProducts.indexOf(pr) +1;
              return pr["name"] + " x"+ index.toString();

            }).join('\n')),
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
            // var barcode = Scanner().scanBarcode();
            var productData = await Product().getProduct('0000040144382');
            addProduct(productData);

            // Product().registerProduct(barcode.toString());
          },
          color: Colors.white,
        ),
      ),
    );
  }
}
