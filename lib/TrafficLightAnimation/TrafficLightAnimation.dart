import 'dart:async';

import 'package:flutter/material.dart';

class Trafficlightanimation extends StatefulWidget {
  const Trafficlightanimation({super.key});

  @override
  State<Trafficlightanimation> createState() => _TrafficlightanimationState();
}

class _TrafficlightanimationState extends State<Trafficlightanimation> {
  double _opacityRED = 1.0;
  double _opacityYELLOW = 0.3;
  double _opacityGREEN = 0.3;
  int _start = 10;
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          if (_opacityRED == 1.0) {
            _opacityRED = 0.3;
            _opacityYELLOW = 1.0;
            _start = 5;
          } else if (_opacityYELLOW == 1.0) {
            _opacityYELLOW = 0.3;
            _opacityGREEN = 1.0;
            _start = 10;
          } else {
            _opacityRED = 1.0;
            _opacityYELLOW = 0.3;
            _opacityGREEN = 0.3;
            _start = 10;
          }
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traffic Light Animation"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 650,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: const Color.fromARGB(255, 0, 0, 0),
                width: 150,
                height: 200,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  _start.toString(),
                  style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: _opacityRED == 1.0
                          ? Colors.red
                          : _opacityGREEN == 1.0
                              ? Colors.green
                              : _opacityYELLOW ==
                                      1.0 // Check if opacityYELLOW is 1.0
                                  ? Colors.yellow
                                  : Colors.white),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: _opacityRED,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: _opacityYELLOW,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: _opacityGREEN,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
