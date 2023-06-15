import 'package:shared_preferences/shared_preferences.dart';

class Score {
  int? score = 0;

  void getScore() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    score = pref.getInt("scoreData");
  }
}