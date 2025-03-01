import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  final String name, email, position, phoneNumber, imageUrl;

  const CustomProfileCard(
      {super.key,
      required this.name,
      required this.email,
      required this.position,
      required this.imageUrl,
      required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 173, 173, 173),
            offset: Offset(4, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: -75,
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Colors.transparent,
                child: ClipOval(child: Image.network(imageUrl)),
              ),
            ),
            Text(name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(
              position,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(email)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(phoneNumber)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
