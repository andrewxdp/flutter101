import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animatedcontainerdemo extends StatefulWidget {
  const Animatedcontainerdemo({super.key});

  @override
  State<Animatedcontainerdemo> createState() => _AnimatedcontainerdemoState();
}

class _AnimatedcontainerdemoState extends State<Animatedcontainerdemo> {
  double _size = 100;
  Color _color = Colors.blue;
  void _changeBox() {
    setState(() {
      _size = _size == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
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
          AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
              height: _size,
              width: _size,
              color: _color),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: _changeBox, child: const Text('Animate Box'))
        ],
      )),
    );
  }
}
