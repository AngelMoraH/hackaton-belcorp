class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String color;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.color,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'color': color,
    };
  }
}
