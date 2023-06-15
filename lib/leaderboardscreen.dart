import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  List<int> quizScore = [];
  int? score;

  @override
  void initState() {
    super.initState();
    getScore();
    setState(() {
      score ??= 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(quizScore.length < 5) {
      quizScore.add(score!);
      quizScore.sort();
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 72.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300.0,
                height: 56.0,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(31, 72, 126, 1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "LEADERBOARD",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          _showScore(quizScore),
        ],
      ),
    );
  }

  void getScore() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    score = pref.getInt("scoreData");
  }

  _showScore(List<int> quizScore) {
    return const Column(
      children: [

      ],
    );
}

  _trackScore(score) {
    return Column(
      children: [
        Container(
          width: 350.0,
          height: 30.0,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                  "rank",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              ),
              Text(
                  score.toString(),
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
