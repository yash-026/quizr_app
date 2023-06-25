import 'package:flutter/material.dart';
import 'package:quizr/leaderboardscreen.dart';
import 'package:quizr/questionnaire.dart';
import 'package:quizr/quizscreen.dart';
import 'package:quizr/timedquizscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      body: Column(
        children: [
          const SizedBox(width: 425.0, height: 72.0),
          Text(
            "QUIZR",
            style: TextStyle(
              fontSize: 64.0,
              fontWeight: FontWeight.w900,
              color: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
            ),
          ),
          const SizedBox(height: 36.0),
          Text(
            "Ready for your brain boost?",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
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
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(235.0, 60.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Theme
                        .of(context)
                        .colorScheme
                        .tertiary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizScreen()
                        )
                    );
                  },
                  child: Text(
                    "CLASSIC MODE",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                    ),
                  ),
                ),
                const SizedBox(height: 48.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(235.0, 60.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Theme
                        .of(context)
                        .colorScheme
                        .tertiary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TimedQuizScreen()
                        )
                    );
                  },
                  child: Text(
                    "TIMER MODE",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                    ),
                  ),
                ),
                const SizedBox(height: 48.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(235.0, 60.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Theme
                        .of(context)
                        .colorScheme
                        .tertiary,
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
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                    ),
                  ),
                ),
                const SizedBox(height: 48.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(235.0, 60.0),
                    foregroundColor: Colors.white,
                    backgroundColor: Theme
                        .of(context)
                        .colorScheme
                        .tertiary,
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
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
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

  _showClassicAlert() {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "INSTRUCTIONS",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.tertiary,
          )
          ),
          const SizedBox(height: 12.0),
          const Text(
              "* The quiz is based on world history.\n"
              "* 10 questions will be asked in the quiz.\n"
              "* There is no time limit.\n"
              "* For each correct answer, 4 marks will be rewarded.\n"
              "* For each incorrect answer, 1 mark will be deducted.\n"
              "* Options once selected cannot be changed.\n"
              "* Questions can be skipped by pressing CONTINUE without selecting any options.\n"
              "* Questions once skipped cannot be attempted again.\n"
              "* No marks will be rewarded or deducted for unattempted questions."
          ),
          const SizedBox(height: 12.0),
          Text(
              "ARE YOU READY?",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.tertiary,
              )
          ),
          const SizedBox(height: 12.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
            fixedSize: const Size(235.0, 60.0),
            foregroundColor: Colors.white,
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .tertiary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
            ),
          ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuizScreen()
                  )
              );
            },
            child: Text(
              "BRING IT ON!",
              style: TextStyle(
                fontSize: 20.0,
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
              ),
            ),
          ),
        ],
      ),
    );
}

  _showTimerAlert() {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              "INSTRUCTIONS",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.tertiary,
              )
          ),
          const SizedBox(height: 12.0),
          const Text(
                  "* The quiz is based on world history.\n"
                  "* 10 questions will be asked in the quiz.\n"
                  "* There is a time limit of 2 minutes 30 seconds.\n"
                  "* After the timer stops, the quiz will be automatically submitted.\n"
                  "* For each correct answer, 4 marks will be rewarded.\n"
                  "* For each incorrect answer, 1 mark will be deducted.\n"
                  "* Options once selected cannot be changed.\n"
                  "* Questions can be skipped by pressing CONTINUE without selecting any options.\n"
                  "* Questions once skipped cannot be attempted again.\n"
                  "* No marks will be rewarded or deducted for unattempted questions."
          ),
          const SizedBox(height: 12.0),
          Text(
              "ARE YOU READY?",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.tertiary,
              )
          ),
          const SizedBox(height: 12.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(235.0, 60.0),
              foregroundColor: Colors.white,
              backgroundColor: Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TimedQuizScreen()
                  )
              );
            },
            child: Text(
              "BRING IT ON!",
              style: TextStyle(
                fontSize: 20.0,
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

