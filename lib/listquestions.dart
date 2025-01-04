import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String _baseURL = 'http://projecttwo.mygamesonline.org';

void main() {
  runApp(MyApp());
}

class Question {
  final int id;
  final String question;
  final String correctAnswer;

  Question(this.id, this.question, this.correctAnswer);

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      int.parse(json['id']),
      json['question'],
      json['correct_answer'],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Question List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuestionList(),
    );
  }
}

class QuestionList extends StatefulWidget {
  @override
  _QuestionListState createState() => _QuestionListState();
}
class _QuestionListState extends State<QuestionList> {
  List<Question> questions = [];

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    final url = Uri.parse('$_baseURL/fetch_questions.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      questions.clear();  // Clear the list before adding new items
      for (var question in jsonResponse) {
        questions.add(Question.fromJson(question));
      }
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to load questions'),
        ),
      );
      print('Failed to load questions');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question List'),
      ),
      body: questions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          return ListTile(
            title: Text('ID: ${question.id}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Question: ${question.question}'),
                Text('Correct Answer: ${question.correctAnswer}'),
              ],
            ),
          );
        },
      ),
    );
  }
}