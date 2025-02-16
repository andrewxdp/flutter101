class ProductData {
  final int? id;
  final String name;
  final String description;
  final double price;
  ProductData(this.id, this.name, this.description, this.price);

  //json --> object
  ProductData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = json['price'];
  // object --> json
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'description': description, 'price': price};
  }
}
