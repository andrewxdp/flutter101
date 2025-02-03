import 'package:flutter/material.dart';

class Answer3 extends StatelessWidget {
  const Answer3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Layout'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Category: Electronics',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            color: const Color.fromARGB(255, 224, 228, 233),
            padding: EdgeInsets.all(10),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          color: Colors.grey,
                        ),
                        Column(
                          children: [
                            Text('Laptop'),
                            Text('999 THB',
                                style: TextStyle(color: Colors.green))
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          color: Colors.grey,
                        ),
                        Column(
                          children: [
                            Text('Smartphone'),
                            Text('699 THB',
                                style: TextStyle(color: Colors.green))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          color: Colors.grey,
                        ),
                        Column(
                          children: [
                            Text('Tablet'),
                            Text(
                              '499 THB',
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          color: Colors.grey,
                        ),
                        Column(
                          children: [
                            Text('Camera'),
                            Text('299 THB',
                                style: TextStyle(color: Colors.green))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
