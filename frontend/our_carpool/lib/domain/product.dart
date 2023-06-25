class Product {
  String? name;
  String? description;
  double? price;
  int? quantity;

  Product({this.name, this.description, this.price, this.quantity});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity
    };
  }
}
