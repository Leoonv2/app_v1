library Globals;
import 'package:shared_preferences/shared_preferences.dart';



// if its the first time the user opens the app, set the goals to these values

int proteinGoal = 150;
int carbsGoal = 200;
int caloriesGoal = 2500;

Future<Map<String, int>> getGoals() async {
  final prefs = await SharedPreferences.getInstance();
  Map<String, int> goals = {
    'protein': prefs.getInt('proteinGoal') ?? 150,
    'carbs': prefs.getInt('carbsGoal') ?? 200,
    'calories': prefs.getInt('caloriesGoal') ?? 2500,
  };
  return goals;
}
void setGoals(Map<String, int> newGoals) {
  // Check if the newGoals map contains the keys for the global variables
  if (newGoals.containsKey('proteinGoal')) {
    // Update the proteinGoal variable with the new value
    proteinGoal = newGoals['proteinGoal']!;
  }
  if (newGoals.containsKey('carbsGoal')) {
    // Update the carbsGoal variable with the new value
    carbsGoal = newGoals['carbsGoal']!;
  }
  if (newGoals.containsKey('caloriesGoal')) {
    // Update the caloriesGoal variable with the new value
    caloriesGoal = newGoals['caloriesGoal']!;
  }
}


int eatenProtein = 0;
int eatenCarbs = 0;
int eatenCalories = 0;


