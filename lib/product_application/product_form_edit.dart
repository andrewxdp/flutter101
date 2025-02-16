import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:workshop/model/product_data.dart';

class ProductFormEdit extends StatefulWidget {
  final dynamic sendProductId;
  const ProductFormEdit({super.key, required this.sendProductId});

  @override
  State<ProductFormEdit> createState() => _ProductFormEditState();
}

class _ProductFormEditState extends State<ProductFormEdit> {
  List<ProductData> preDataProduct = [];

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  Future<void> fetchDataIndividual() async {
    print(widget.sendProductId);
    try {
      var response = await http.get(
          Uri.parse('http://localhost:8001/products/${widget.sendProductId}'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        setState(() {
          preDataProduct = [ProductData.fromJson(data)];
        });
        _nameController.text = preDataProduct[0].name;
        _descriptionController.text = preDataProduct[0].description;
        _priceController.text = preDataProduct[0].price.toString();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  Future<void> updateProduct(dynamic idUpdate, String productName,
      String description, double price) async {
    try {
      var response = await http.put(
          Uri.parse("http://localhost:8001/products/$idUpdate"),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "name": productName,
            "description": description,
            "price": price
          }));
      if (response.statusCode == 200) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Update Product Success!'),
          backgroundColor: Colors.green,
        ));
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataIndividual();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Product',
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

                  decoration: const InputDecoration(labelText: 'Product Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Product Name';
                    }
                    return null;
                  },
                  // onChanged: (value) => print(value),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                  // onChanged: (value) => print(value),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'price'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter price';
                    }
                    return null;
                  },
                  // onChanged: (value) => print(value),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        updateProduct(
                            widget.sendProductId,
                            _nameController.text,
                            _descriptionController.text,
                            double.parse(_priceController.text));
                      }
                    },
                    child: const Text('Update  Product')),
              ],
            ),
          ),
        ));
  }
}
