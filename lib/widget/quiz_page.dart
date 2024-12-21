import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}
class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': ['Paris', 'London', 'Berlin', 'Madrid'],
      'correct': 'Paris',
    },
    {
      'question': 'Who painted the Mona Lisa?',
      'answers': [
        'Leonardo da Vinci',
        'Vincent van Gogh',
        'Picasso',
        'Michelangelo'
      ],
      'correct': 'Leonardo da Vinci',
    },
    {
      'question': 'What is the largest planet in our solar system?',
      'answers': ['Earth', 'Jupiter', 'Mars', 'Saturn'],
      'correct': 'Jupiter',
    },
  ];

  void _checkAnswer(String answer) {
    if (answer == _questions[_currentQuestionIndex]['correct']) {
      setState(() {
        _score += 10;
      });
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _showScoreDialog();
    }
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Quiz Finished!'),
        content: Text('Your Score: $_score'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: Text('Back to Home'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _questions[_currentQuestionIndex]['question'] as String,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...(_questions[_currentQuestionIndex]['answers'] as List<String>)
                .map((answer) {
              return ElevatedButton(
                onPressed: () => _checkAnswer(answer),
                child: Text(answer),
              );
            }),
          ],
        ),
      ),
    );
  }
}
