import "package:flutter/material.dart";
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestart});

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> result = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      result.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_ans': questions[i].answers[0],
        'user_ans': chosenAnswers[i],
      });
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final resultData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = resultData.where((item) {
      return item['user_ans'] == item["correct_ans"];
    }).length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                "You have answered $numCorrectQuestions out of $numTotalQuestions correctly!",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 30,
            ),
            QuestionResults(resultData: resultData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onRestart,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.replay_5_rounded),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Restart")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
