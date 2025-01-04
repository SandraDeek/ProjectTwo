import 'package:flutter/material.dart';
import 'quiz.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final int stars;


  ScorePage({required this.score, required this.totalQuestions, required this.stars});

  @override
  Widget build(BuildContext context) {

    //double percentage = (score / totalQuestions) * 100;
    int stars = 0;
    String resultImage;
    String starsImage;

    if (score >= 8) {
      stars = 3;
    } else if (score >= 5) {
      stars = 2;
    } else if (score >= 2) {
      stars = 1;
    } else {
      stars = 0;
    }

    if (score >= 2) {
      resultImage = 'assets/winner.png';
    } else {
      resultImage = 'assets/looser.png';
    }

    switch (stars) {
      case 3:
        starsImage = 'assets/3stars.png';
        break;
      case 2:
        starsImage = 'assets/2stars.png';
        break;
      case 1:
        starsImage = 'assets/1star.png';
        break;
      default:
        starsImage = '';
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              resultImage,
              width: 100, // Adjust the width as needed
              height: 100, // Adjust the height as needed
            ),
            const SizedBox(height: 20),
            if (stars > 0) // Display stars only if stars are greater than 0
              Image.asset(
                starsImage,
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
              ),
            const SizedBox(height: 20),
            Text(
              'Your Score: $score/$totalQuestions',
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Reset score and currentQuestionIndex to restart the quiz
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Quiz(), // Create a new instance of the Quiz widget
                  ),
                );
              },
              child: const Text('Play Again'),
            ),
          ],
        ),
      ),
    );
  }
}