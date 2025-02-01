import 'package:flutter/material.dart';
import 'package:workshop/answer1.dart';
import 'package:workshop/answer2.dart';
import 'package:workshop/answer3.dart';
import 'package:workshop/answer4.dart';

class AnswerPortal extends StatelessWidget {
  const AnswerPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Answer'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Answer1()));
                },
                child: Text('Answer1')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Answer2()));
                },
                child: Text('Answer2')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Answer3()));
                },
                child: Text('Answer4')),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Answer4()));
                },
                child: Text('Answer5')),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 244, 255),
    );
  }
}
