import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quizr/homescreen.dart';
import 'package:quizr/questionlist.dart';
import 'package:quizr/timedresultscreen.dart';

class TimedQuizScreen extends StatefulWidget {
  const TimedQuizScreen({super.key});

  @override
  State<TimedQuizScreen> createState() => _TimedQuizScreenState();
}

class _TimedQuizScreenState extends State<TimedQuizScreen> {
  List<Question> questionList = getQuestions();
  List<int> numbers = List.generate(10, (index) => index);
  int currentQuestionIndex = 0;
  int counter = 1;
  int timedScore = 0;
  int timedCorrectAnswers = 0;
  int timedBestScore = 0;
  int timeLeft = 150;
  Answer? selectedAnswer;

  randomPicker() {
    currentQuestionIndex = pickRandomNumber();
  }

  int pickRandomNumber() {
    if (numbers.isEmpty) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => TimedResultScreen(timedScore, timedCorrectAnswers)));
    }

    int randomIndex = Random().nextInt(numbers.length);
    int pickedNumber = numbers[randomIndex];
    numbers.removeAt(randomIndex);

    return pickedNumber;
  }

  @override
  void initState() {
    super.initState();
    _startSecondTimer();
  }
  @override
  void dispose() {
    super.dispose();
    secondTimer!.cancel();
  }

  Timer? secondTimer;

  _startSecondTimer() {
    secondTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if(timeLeft > 0) {
            timeLeft--;
          }
          else {
            secondTimer!.cancel();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TimedResultScreen(
                        timedScore, timedCorrectAnswers
                    )
                )
            );
          }
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          timedBestScore.toString(),
                          style: const TextStyle(
                            color: Color.fromRGBO(25, 29, 99, 1),
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        ((timeLeft / 3600).round() < 10)? "0${(timeLeft / 3600).round()}" : (timeLeft / 3600).round().toString(),
                        style: const TextStyle(
                          color: Color.fromRGBO(7, 4, 23, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(
                          color: Color.fromRGBO(7, 4, 23, 1),
                          fontSize: 25,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        ((timeLeft ~/ 60) < 10)? "0${(timeLeft ~/ 60)}" : (timeLeft ~/ 60).toString(),
                        style: const TextStyle(
                          color: Color.fromRGBO(7, 4, 23, 1),
                          fontSize: 25,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(
                          color: Color.fromRGBO(7, 4, 23, 1),
                          fontSize: 25,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        ((timeLeft).remainder(60) < 10)? "0${(timeLeft).remainder(60)}" : (timeLeft).remainder(60).toString(),
                        style: const TextStyle(
                          color: Color.fromRGBO(7, 4, 23, 1),
                          fontSize: 25,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      iconSize: 30.0,
                      color: const Color.fromRGBO(21, 21, 21, 80),
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
              backgroundColor: const Color.fromRGBO(244, 243, 246, 1),
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
                style: const TextStyle(
                  color: Color.fromRGBO(25, 29, 99, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 18.0),
              _answerList(),
              const SizedBox(height: 24.0),
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
            (t) => _answerButton(t),
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
              timedScore=timedScore+4;
              timedCorrectAnswers++;
            }
            else {
              timedScore--;
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
      margin: const EdgeInsets.symmetric(vertical: 10.0),
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
                    builder: (context) => TimedResultScreen(timedScore, timedCorrectAnswers)
                ),
              );
            } else {
              //next question
              setState(() {
                selectedAnswer = null;
                counter++;
                currentQuestionIndex = pickRandomNumber();
              });
            }
          },
          child: Text(isLastQuestion ? "FINISH" : "CONTINUE"),
        ),
      ),
    );
  }
}