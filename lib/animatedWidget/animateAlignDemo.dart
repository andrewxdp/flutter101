import 'package:flutter/material.dart';

class Animatealigndemo extends StatefulWidget {
  const Animatealigndemo({super.key});

  @override
  State<Animatealigndemo> createState() => _AnimatealigndemoState();
}

class _AnimatealigndemoState extends State<Animatealigndemo> {
  bool _isLeft = true;
  void _togglePosition() {
    setState(() {
      _isLeft = !_isLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Container')),
      body: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(seconds: 1),
            alignment: _isLeft ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(width: 100, height: 100, color: Colors.red),
          ),
          Center(
            child: ElevatedButton(
                onPressed: _togglePosition, child: const Text('Move Box')),
          )
        ],
      ),
    );
  }
}
