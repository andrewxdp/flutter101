import 'package:flutter/material.dart';
import 'package:workshop/custom_card.dart';
import 'package:workshop/custom_counter_widget.dart';
import 'package:workshop/custom_profile_card.dart';

class CustomWidget extends StatelessWidget {
  final VoidCallback toggleTheme;
  final ThemeMode themeMode;

  const CustomWidget(
      {super.key, required this.toggleTheme, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Widget"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: toggleTheme,
            icon: Icon(themeMode == ThemeMode.light
                ? Icons.nightlight_round
                : Icons.sunny),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomProfileCard(
              name: "TeeraKarn Petchann",
              email: "25TeeraKarn@gmail.com",
              position: "Full Stack Developer",
              imageUrl: "https://media.tenor.com/DFfCL02_DCcAAAAM/cat-look.gif",
              phoneNumber: "123456789",
            ),
          ],
        ),
      ),
    );
  }
}
