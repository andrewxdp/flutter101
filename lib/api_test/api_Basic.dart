import 'dart:convert';

void main() {
  String jsonString = '{"name":"John Doe","age":25}';
  Map<String, dynamic> user = jsonDecode(jsonString);
  List<dynamic> user1 = jsonDecode(jsonString);
  print(user['name']); //output : John Doe
  print(user['age']); //output : 25
  //dart object --> json
  String jsonString2 = jsonEncode(user); //output : {"name":"John Doe","age":25}
  print(jsonString2);
}
// import 'dart:convert';

// class Student {
//   final int id;
//   final String name;
//   Student(this.id, this.name);
//   //json --> object
//   Student.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         name = json['name'];
//   // object --> json
//   Map<String, dynamic> toJson() {
//     return {'id': id, 'name': name};
//   }
// }

// void main() {
//   //json --> dart object
//   String jsonString = '''[
//     {"id" : 1 ,"name":"John Doe"},
//     {"id" : 2 ,"name":"John Dan"},
//     {"id" : 3 ,"name":"John Doi"}
//   ]''';

//   //JsonSting --> List of Object
//   List<dynamic> jsonList = jsonDecode(jsonString);
//   print(jsonList);
//   List<Student> students =
//       jsonList.map((item) => Student.fromJson(item)).toList();
//   for(var student in students){
//     print("ID: ${student.id}, Name : ${student.name}");
//   }
// }
