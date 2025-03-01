import 'package:flutter/material.dart';

class Themetest extends StatelessWidget {
  const Themetest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hello World",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Press ME"))
        ],
      ),
    );
  }
}
