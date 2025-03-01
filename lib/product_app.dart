import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:workshop/model/product_data.dart';
import 'package:workshop/product_application/product_form.dart';
import 'package:workshop/product_application/product_form_edit.dart';

class ProductApp extends StatefulWidget {
  const ProductApp({super.key});

  @override
  State<ProductApp> createState() => _ProductAppState();
}

class _ProductAppState extends State<ProductApp> {
  List<ProductData> products = [];
  bool isLoaded = false;

  Future<void> fetchData() async {
    setState(() {
      isLoaded = false;
    });

    try {
      var response =
          await http.get(Uri.parse('http://localhost:8001/products'));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          products = data.map((item) => ProductData.fromJson(item)).toList();
          isLoaded = true;
        });
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print("Error fetching data: $e");
      setState(() {
        isLoaded = true; // Prevent infinite loading state
      });
    }
  }

  Future<void> deleteProduct(dynamic idDelete) async {
    try {
      var response = await http
          .delete(Uri.parse("http://localhost:8001/products/$idDelete"));
      if (response.statusCode == 200) {
        fetchData();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Delete Success!'),
          backgroundColor: Colors.green,
        ));
      } else {
        throw Exception("Failed to delete products");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Inventory')),
      body: isLoaded
          ? Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: Text('${products[index].id}'),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(products[index].name),
                              Text(
                                '฿${products[index].price}',
                                style: const TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(products[index].description),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text(
                                        'Are you sure you want to delete this item?',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // content:
                                      //     const Text('AlertDialog description'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            deleteProduct(products[index].id),
                                            Navigator.pop(context, 'Cancel')
                                          },
                                          child: const Text('OK'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: Icon(Icons.delete),
                                iconSize: 15,
                                color: Colors.grey,
                              ),
                              IconButton(
                                onPressed: () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductFormEdit(
                                        sendProductId: products[index].id,
                                      ),
                                    ),
                                  );
                                  if (result == true) {
                                    fetchData();
                                  }
                                },
                                icon: Icon(Icons.edit),
                                iconSize: 15,
                                color: Colors.grey,
                              )
                            ],
                          ));
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductForm()),
                        );

                        if (result == true) {
                          fetchData();
                        }
                      },
                      child: const Text('Add Product'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
