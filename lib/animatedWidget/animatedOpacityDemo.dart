import 'package:flutter/material.dart';

class AnimatedopacityDemo extends StatefulWidget {
  const AnimatedopacityDemo({super.key});

  @override
  State<AnimatedopacityDemo> createState() => _AnimatedopacityDemoState();
}

class _AnimatedopacityDemoState extends State<AnimatedopacityDemo> {
  double _opacity = 1.0;
  void _toggleOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.2 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Container')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: _opacity,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: _toggleOpacity, child: const Text('Animate Box'))
        ],
      )),
    );
  }
}
