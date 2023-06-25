// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:quizr/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimedResultScreen extends StatelessWidget {

  final timedScoreGained;
  final timedCorrectPredictions;
  const TimedResultScreen(this.timedScoreGained, this.timedCorrectPredictions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const SizedBox(height: 140.0),
          const Row(
            children: [
              SizedBox(width: 94.0),
              Icon(
                Icons.ad_units,
                color: Color.fromRGBO(31, 72, 126, 1),
                size: 225.0,
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          Text(
            "Results of Quiz",
            style: TextStyle(
              fontSize: 24.0,
              color: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 56.0),
          Container(
            width: 350.0,
            height: 72.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12.0),
                const Icon(
                  Icons.ac_unit,
                  color: Color.fromRGBO(31, 72, 126, 1),
                  size: 25.0,
                ),
                const SizedBox(width: 12.0),
                const Text(
                  "SCORE GAINED",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(6, 7, 16, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 115.0),
                Text(
                  timedScoreGained.toString(),
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(6, 7, 16, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4.0),
          Container(
            width: 350.0,
            height: 72.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12.0),
                const Icon(
                  Icons.add_chart,
                  color: Color.fromRGBO(31, 72, 126, 1),
                  size: 25.0,
                ),
                const SizedBox(width: 12.0),
                const Text(
                  "CORRECT PREDICTIONS",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(6, 7, 16, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 36.0),
                Text(
                  timedCorrectPredictions.toString(),
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(6, 7, 16, 1),
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 100.0),
          SizedBox(
            width: 350.0,
            height: 60.0,
            child: ElevatedButton(
                onPressed: () {
                  setScore(timedScoreGained);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()
                      )
                  );
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )
                ),
                child: const Text(
                  "OKAY",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
            ),
          )
        ],
      ),
    );
  }

  Future<void> setScore(scoreValue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("timedScoreData", scoreValue);
  }
}