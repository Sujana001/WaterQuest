import 'package:flutter/material.dart';
import 'package:waterquest_mvp/score.dart';

class Quizzes extends StatefulWidget {
  const Quizzes({super.key});

  @override
  State<Quizzes> createState() => _QuizzesState();
}

class _QuizzesState extends State<Quizzes> {
  int score2 = 0;
  int currentQuestion = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          'What is the most common cause of water pollution in rivers near urban areas?',
      'options': [
        {'text': 'Lightning strikes', 'isCorrect': false},
        {'text': 'Plastic and industrial waste', 'isCorrect': true},
        {'text': 'Too many fish', 'isCorrect': false},
        {'text': 'Clean drinking water', 'isCorrect': false},
      ],
    },
    {
      'question': 'Which of the following is a consequence of water pollution?',
      'options': [
        {'text': 'Increased oxygen in water', 'isCorrect': false},
        {'text': 'Healthier fish populations', 'isCorrect': false},
        {
          'text': 'Waterborne diseases like cholera and diarrhea',
          'isCorrect': true,
        },
        {'text': 'Cleaner riverbanks', 'isCorrect': false},
      ],
    },
    {
      'question': 'What is one way you can help reduce water pollution?',
      'options': [
        {'text': 'Throw waste into rivers', 'isCorrect': false},
        {'text': 'Wash clothes in the river', 'isCorrect': false},
        {'text': 'Use more plastic bottles', 'isCorrect': false},
        {'text': 'Avoid chemical fertilizers near water', 'isCorrect': true},
      ],
    },
  ];

  void checkAnswer(bool isCorrect) {
    if (isCorrect) score2 += 10;
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      // Go to pledge screen with score
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Score(score: score2)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quizzes'),
        backgroundColor: Color.fromARGB(255, 14, 223, 251),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(150),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/p6.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Text(
                'Q${currentQuestion + 1}. ${question['question']}',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 10),
              ...question['options'].map<Widget>((option) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      checkAnswer(option['isCorrect']);
                    },
                    child: Text(option['text']),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
