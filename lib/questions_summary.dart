import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionResults extends StatelessWidget {
  const QuestionResults({required this.resultData, super.key});

  final List<Map<String, Object>> resultData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: resultData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: data["user_ans"] == data["correct_ans"]
                          ? Colors.teal
                          : Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            data['question'] as String,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            data['user_ans'] as String,
                            style: GoogleFonts.lato(
                              color: Colors.pinkAccent,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            data['correct_ans'] as String,
                            style: GoogleFonts.lato(
                              color: Colors.teal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
