import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:workshop/model/user_data.dart';

class SimpleApiCall extends StatefulWidget {
  const SimpleApiCall({super.key});

  @override
  State<SimpleApiCall> createState() => _SimpleApiCallState();
}

class _SimpleApiCallState extends State<SimpleApiCall> {
  List<UserData> users = [];
  bool isLoaded = true;
  Future<void> fetchData() async {
    setState(() {
      isLoaded = false;
    });
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        print(data);
        setState(() {
          users = data.map((item) => UserData.fromJson(item)).toList();
          isLoaded = true;
        });
      } else {
        print('initial data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  //ทำงานครั้งแรก
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple API Call'),
        ),
        body: isLoaded
            ? ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text('${users[index].id}'),
                    title: Text(users[index].name),
                    subtitle: Text(users[index].email),
                    trailing: Text('(${users[index].username})'),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()));
  }
}
