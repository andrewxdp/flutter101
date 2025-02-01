import 'package:flutter/material.dart';

class Answer4 extends StatelessWidget {
  const Answer4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile Page'),
          centerTitle: true,
          backgroundColor: Colors.orange,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              width: double.infinity,
              height: 150,
              color: Colors.blueAccent,
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'TeeraKarn Petchann',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              height: 640,
              padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("25TeeraKarn@gmail.com")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("062-537-9023")
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.map,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Banglen , Nakornpathom")
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(fontSize: 15),
                    )),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Logout', style: TextStyle(fontSize: 15)),
                )
              ],
            )
          ],
        ));
  }
}
