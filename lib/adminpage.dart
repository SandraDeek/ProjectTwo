import 'package:flutter/material.dart';
import 'addquestion.dart'; // Import the AddQuiz page
import 'listquestions.dart'; // Import the QuestionListing page

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Column(
                children: <Widget>[
                  Text(
                    "Welcome to Admin Page",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/ask-me.png"),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddQuestion()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text(
                      "ADD QUESTION",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuestionList()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      "VIEW QUESTIONS",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}