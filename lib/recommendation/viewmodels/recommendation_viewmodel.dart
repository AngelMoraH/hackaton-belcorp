import 'package:flutter/material.dart';
import 'package:lumea/recommendation/models/product.dart';
import 'package:lumea/recommendation/models/recommendation.dart';

class RecommendationViewmodel extends ChangeNotifier {
  Recommendation? _recommendation;
  bool _isLoading = false;

  // Getter para obtener la recomendación
  Recommendation? get recommendation => _recommendation;

  // Getter para obtener el estado de carga
  bool get isLoading => _isLoading;

  // Simulación de carga de recomendación (en una app real podrías hacer una llamada a la API)
  Future<void> loadRecommendation(String imageUrl) async {
    _isLoading = true;
    notifyListeners();

    // Simulación de espera (como si estuvieras llamando a un API)
    await Future.delayed(const Duration(seconds: 2));

    // Simulamos la carga de una recomendación, colores HEX
    _recommendation = Recommendation(imageUrl: imageUrl, colorimetry: [
      '#FF0000',
      '#00FF00',
      '#0000FF',
    ], products: [
      Product(
        name: 'Producto 1',
        description: 'Descripción del producto 1',
        price: 100.0,
        imageUrl:
            'https://static.wixstatic.com/media/35626c_2fa84b39cc26439a8817931fc4971676~mv2.png/v1/fill/w_480,h_480,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/35626c_2fa84b39cc26439a8817931fc4971676~mv2.png',
        color: '#FF0000',
      ),
      Product(
        name: 'Producto 2',
        description: 'Descripción del producto 2',
        price: 200.0,
        imageUrl: 'https://i8.amplience.net/i/Cosnova/4203322',
        color: '#00FF00',
      ),
      Product(
        name: 'Producto 3',
        description: 'Descripción del producto 3',
        price: 300.0,
        imageUrl:
            'https://png.pngtree.com/png-clipart/20230427/original/pngtree-lipstick-blue-touch-up-makeup-png-image_9112193.png',
        color: '#0000FF',
      ),
    ]);

    _isLoading = false;
    notifyListeners();
  }

  // Función para limpiar la recomendación
  void clearRecommendation() {
    _recommendation = null;
    notifyListeners();
  }
}
