// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quizr/homescreen.dart';
import 'package:quizr/questionlist.dart';
import 'package:quizr/resultscreen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = Random().nextInt(10);
  int counter = 1;
  int score = 0;
  int correctAnswers = 0;
  int bestScore = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                width: 50.0,
                height: 30.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 4.0),
                    const Icon(
                      Icons.ac_unit_sharp,
                      color: Color.fromRGBO(31, 72, 126, 1),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      bestScore.toString(),
                      style: const TextStyle(
                        color: Color.fromRGBO(25, 29, 99, 1),
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                  "00:00:00",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                ),
              IconButton(
                iconSize: 28.0,
                color: const Color.fromRGBO(21, 21, 21, 1),
                  onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()
                      )
                  );
                  },
                  icon: const Icon(
                      Icons.cancel_outlined,
                  )
              ),
            ],
          ),
          _questionWidget(),
        ]),
      ),
    );
  }

  _questionWidget() {
    double percent = ((counter) / questionList.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            LinearPercentIndicator(
              width: 330.0,
              lineHeight: 15.0,
              percent: percent,
              barRadius: const Radius.circular(8.0),
              progressColor: const Color.fromRGBO(55, 105, 150, 1),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            Text(
              "$counter / ${questionList.length}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(117, 117, 117, 1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 628.0,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Text(
                questionList[currentQuestionIndex].questionText,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 18.0),
              _answerList(),
              _nextButton(),
            ],
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
      )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          backgroundColor: isSelected ? const Color.fromRGBO(31, 72, 126, 1) : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
        ),
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score=score+4;
              correctAnswers++;
            }
            else {
              score--;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
        },
        child: Text(answer.answerText, style: const TextStyle(
          fontSize: 16.0,
        ),),
      ),
    );
  }

  _nextButton() {
    bool isSelected = false;
    bool isLastQuestion = false;
    if(selectedAnswer != null) {
      isSelected = true;
    }
    if (counter == questionList.length) {
      isLastQuestion = true;
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: isSelected? const Color.fromRGBO(31, 72, 126, 1) : const Color.fromRGBO(117, 117, 117, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            if (isLastQuestion) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(score, correctAnswers)
                ),
              );
            } else {
              //next question
              setState(() {
                selectedAnswer = null;
                currentQuestionIndex = Random().nextInt(9);
                counter++;
              });
            }
          },
          child: Text(
              isLastQuestion ? "FINISH" : "CONTINUE",
            style: TextStyle(
              color: selectedAnswer == null? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}