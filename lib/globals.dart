library Globals;
import 'package:shared_preferences/shared_preferences.dart';




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
  if (newGoals.containsKey('proteinGoal')) {
    proteinGoal = newGoals['proteinGoal']!;
  }
  if (newGoals.containsKey('carbsGoal')) {
    carbsGoal = newGoals['carbsGoal']!;
  }
  if (newGoals.containsKey('caloriesGoal')) {
    caloriesGoal = newGoals['caloriesGoal']!;
  }
}




List<Map<String, dynamic>> eatenProducts = [];
int eatenProtein = 0;
int eatenCarbs = 0;
int eatenCalories = 0;


