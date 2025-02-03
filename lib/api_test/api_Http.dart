import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final int id;
  final String name;
  final String phone;
  final String city;
  User(this.id, this.name, this.phone, this.city);
  //json --> object
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        phone = json['phone'],
        city = json['address']['city'];
  // object --> json
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'phone': phone, 'city': city};
  }
}

void main() {
  void fetchUser() async {
    try {
      //await is waiting http.get Before run code next line
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        User userData = User.fromJson(data);

        print(userData.city);
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  fetchUser();
}
