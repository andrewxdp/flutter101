import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:workshop/model/aqi_data.dart';

class AirQualityIndex extends StatefulWidget {
  const AirQualityIndex({super.key});

  @override
  State<AirQualityIndex> createState() => _AirQualityIndexState();
}

class _AirQualityIndexState extends State<AirQualityIndex> {
  List<AqiData> aqi_data = [];
  String scale = '';

  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.waqi.info/feed/here/?token=fea9bdd1b04b3d51075ca91f0835fe63ec52d940'));
      // print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        setState(() {
          aqi_data = [AqiData.fromJson(data['data'])];
        });
        AqiData aqiData = AqiData(data['data']['aqi'], data['data']['city'],
            data['data']['iaqi']['t']['v']);
        scale = aqiData.getAqiScale();
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Air Quality Index (AQI)',
          style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 136, 134, 134)),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFFF7e5f),
              Color(0xFFFF3b47b),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.4, 0.7],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on,
                      color: Colors.white,
                      size: 50,
                      shadows: [
                        Shadow(
                          color: const Color.fromARGB(255, 145, 142,
                              142), // Choose the color of the first shadow
                          blurRadius:
                              2.0, // Adjust the blur radius for the first shadow effect
                          offset: Offset(2.0,
                              2.0), // Set the horizontal and vertical offset for the first shadow
                        )
                      ]),
                  Text(
                    aqi_data.map((i) => '${i.city}').join(),
                    style: GoogleFonts.poppins(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: const Color.fromARGB(255, 145, 142,
                                142), // Choose the color of the first shadow
                            blurRadius:
                                2.0, // Adjust the blur radius for the first shadow effect
                            offset: Offset(2.0,
                                2.0), // Set the horizontal and vertical offset for the first shadow
                          )
                        ]),
                  ),
                ],
              ),
              Text(
                aqi_data.map((i) => '${i.aqi}').join(),
                style: GoogleFonts.poppins(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: const Color.fromARGB(255, 145, 142,
                            142), // Choose the color of the first shadow
                        blurRadius:
                            2.0, // Adjust the blur radius for the first shadow effect
                        offset: Offset(2.0,
                            2.0), // Set the horizontal and vertical offset for the first shadow
                      )
                    ]),
              ),
              Text(
                'μg/m³',
                style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                aqi_data.map((i) => 'Temperature : ${i.temperature} °C').join(),
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Air Quality',
                style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                scale,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              TextButton(
                onPressed: () {
                  fetchData();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh, color: Colors.white, size: 30),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Refresh',
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// ElevatedButton(
//                 onPressed: () => {},
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 child: Text(
//                   'Refresh',
//                   style: TextStyle(
//                       color: const Color.fromARGB(255, 255, 255, 255)),
//                 ),
//               ),
