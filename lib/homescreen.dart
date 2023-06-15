import 'package:flutter/material.dart';
import 'package:quizr/leaderboardscreen.dart';
import 'package:quizr/questionnaire.dart';
import 'package:quizr/quizscreen.dart';
import 'package:quizr/timedquizscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const SizedBox(width: 425.0, height: 72.0),
          Text(
              "QUIZR",
          style: TextStyle(
            fontSize: 64.0,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          ),
          const SizedBox(height: 36.0),
          Text(
              "Ready for your brain boost?",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          ),
          const SizedBox(height: 55.0),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 472.0,
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(235.0, 60.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuizScreen()
                      ),
                    );
                  },
                  child: Text(
                    "CLASSIC MODE",
                    style: TextStyle(
                    fontSize: 20.0,
                      color: Theme.of(context).colorScheme.primary,
                  ),
                  ),
                ),
                const SizedBox(height: 48.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(235.0, 60.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TimedQuizScreen()
                      ),
                    );
                  },
                  child: Text(
                    "TIMER MODE",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 48.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(235.0, 60.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Questionnaire()
                        )
                    );
                  },
                  child: Text(
                    "QUESTIONNAIRE",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 48.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(235.0, 60.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Leaderboard()
                        )
                    );
                  },
                  child: Text(
                    "LEADERBOARD",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
