import 'package:lumea/recommendation/models/product.dart';

class Recommendation {
  final String imageUrl;
  final List<String> colorimetry;
  final List<Product> products;

  Recommendation(
      {required this.imageUrl,
      required this.colorimetry,
      required this.products});

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      imageUrl: json['imageUrl'],
      colorimetry: json['colorimetry'].cast<String>(),
      products: json['products']
          .map<Product>((product) => Product.fromJson(product))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'colorimetry': colorimetry,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}
