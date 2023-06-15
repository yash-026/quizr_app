// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:quizr/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultScreen extends StatelessWidget {

  final scoreGained;
  final correctPredictions;
  const ResultScreen(this.scoreGained, this.correctPredictions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const Text(
              "Results of Quiz",
            style: TextStyle(
              fontSize: 24.0,
              color: Color.fromRGBO(25, 29, 99, 1),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 56.0),
          Container(
            width: 350.0,
            height: 72.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(244, 243, 246, 1),
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
                    scoreGained.toString(),
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
              color: const Color.fromRGBO(244, 243, 246, 1),
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
                  correctPredictions.toString(),
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
                  setScore(scoreGained);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()
                      )
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(31, 72, 126, 1),
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
    pref.setInt("scoreData", scoreValue);
  }
}
