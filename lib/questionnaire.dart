import 'package:flutter/material.dart';
import 'package:quizr/questionlist.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({super.key});

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  List<Question> questionList = getQuestions().toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "QUESTIONNAIRE",
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
        ],
      ),
    );
  }

  _showQuestionList() {
    return const Column(
      children: [

      ],
    );
  }

  Widget _showQuestionButton(Question question) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
    borderRadius: BorderRadius.circular(12.0),
    ),
    alignment: Alignment.center,
      child: ElevatedButton(onPressed: () {},
          child: Text(
              question.questionText,
            style: const TextStyle(
                fontSize: 16.0,
            ),

      ),
    )
    );
  }
}
