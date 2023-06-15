import 'package:flutter/material.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({super.key});

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  @override
  Widget build(BuildContext context) {
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
}
