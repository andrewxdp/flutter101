import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _selectedItem;
  String? _gender = 'Female';
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Registration From (650710556)',
            style: TextStyle(
                fontSize: 20, color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Full Name';
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
                  decoration: const InputDecoration(labelText: 'Email'),
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
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                          title: const Text('Male'),
                          value: 'Male',
                          groupValue: _gender,
                          onChanged: (value) => setState(() {
                                _gender = value.toString();
                              })),
                    ),
                    Expanded(
                      child: RadioListTile(
                          title: const Text('Female'),
                          value: 'Femal',
                          groupValue: _gender,
                          onChanged: (value) => setState(() {
                                _gender = value.toString();
                              })),
                    )
                  ],
                ),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Province'),
                  value: _selectedItem,
                  items: ['Bangkok', 'Chiang Mai', 'Phuket', 'Khon Kaen']
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
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('User input: ${_nameController.text}');
                      }
                    },
                    child: const Text('Submit')),
              ],
            ),
          ),
        ));
  }
}
