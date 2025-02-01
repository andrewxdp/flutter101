import 'package:flutter/material.dart';

class FormSimple extends StatefulWidget {
  const FormSimple({super.key});
  @override
  State<FormSimple> createState() => _FormSimpleState();
}

class _FormSimpleState extends State<FormSimple> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _selectedItem;
  bool _isChecked = false;
  String? _gender = 'Female';
  bool _isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Simple Form',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 27, 81, 199),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) => print(value),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) => print(value),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      hintText: 'Select an Option',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0))),
                  value: _selectedItem,
                  items: ['Option 1', 'Option 2', 'Option 3']
                      .map((item) =>
                          DropdownMenuItem(value: item, child: Text(item)))
                      .toList(),
                  onChanged: (value) {
                    _selectedItem = value;
                  },
                  validator: (value) =>
                      value == null ? 'Please select an option' : null,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [],
                ),
                RadioListTile(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) => setState(() {
                          _gender = value.toString();
                        })),
                RadioListTile(
                    title: const Text('Female'),
                    value: 'Femal',
                    groupValue: _gender,
                    onChanged: (value) => setState(() {
                          _gender = value.toString();
                        })),
                RadioListTile(
                    title: const Text('LGBTQ'),
                    value: 'LGBTQ',
                    groupValue: _gender,
                    onChanged: (value) => setState(() {
                          _gender = value.toString();
                        })),
                CheckboxListTile(
                    title: const Text('Accept Terms & Conditions'),
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    }),
                SizedBox(
                  height: 10,
                ),
                SwitchListTile(
                    title: const Text('Enable Notifications'),
                    value: _isSwitched,
                    onChanged: (value) => setState(() {
                          _isSwitched = value;
                        })),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('User input: ${_nameController.text}');
                      }
                    },
                    child: const Text('Save')),
              ],
            ),
          ),
        ));
  }
}
