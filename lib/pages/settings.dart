import 'package:app_v1/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:app_v1/globals.dart' as globals;
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int proteinGoal = 0;
  int carbsGoal = 0;
  int caloriesGoal = 0;

  @override
  void initState() {
    super.initState();
    loadGoals();
  }

  void loadGoals() async {
    var obj = await globals.getGoals();
    setState(() {
      proteinGoal = obj['protein']!;
      carbsGoal = obj['carbs']!;
      caloriesGoal = obj['calories']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Settings',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 37, 37, 37),
          title: Center(child: const Text('Settings')),
          //make button to go back to home page
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: caloriesGoal.toString(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Calorie Goal',
                hintText: 'e.g 2500',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value == '') {
                  proteinGoal = 0;
                  return;
                }
                caloriesGoal = int.parse(value);
              },
            ),
            TextFormField(
              initialValue: proteinGoal.toString(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Protein Goal',
                hintText: 'e.g 150',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value == '') {
                  proteinGoal = 0;
                  return;
                }
                proteinGoal = int.parse(value);
              },
            ),
            
            TextFormField(
              initialValue: carbsGoal.toString(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Carb Goal',
                hintText: 'e.g 200',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value == '') {
                  proteinGoal = 0;
                  return;
                }
                carbsGoal = int.parse(value);
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
          currentIndex: 2,
          selectedItemColor: Colors.primaries[3],
          onTap: (index) {
            if (index == 0) {
              // switch to settings page
              globals.setGoals({
                'proteinGoal': proteinGoal,
                'carbsGoal': carbsGoal,
                'caloriesGoal': caloriesGoal,
              });
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          },
        ),
      ),
    );
  }
}
