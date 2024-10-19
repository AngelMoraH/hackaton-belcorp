import 'package:flutter/material.dart';
import 'package:lumea/user/models/user.dart';

class UserViewModel extends ChangeNotifier {
  User? _loggedInUser;
  bool _isLoading = false;

  // Getter para obtener el usuario logueado
  User? get loggedInUser => _loggedInUser;

  // Getter para obtener el estado de carga
  bool get isLoading => _isLoading;

  // Simulación de login (en una app real podrías hacer una llamada a la API)
  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulación de espera (como si estuvieras llamando a un API)
    await Future.delayed(const Duration(seconds: 2));

    // Simulamos el éxito de un inicio de sesión con un usuario falso
    _loggedInUser = User(
      name: 'Juan Perez',
      email: email,
      id: '1',
      password: password,
    );

    _isLoading = false;
    notifyListeners();
  }

  // Función para cerrar sesión
  void logout() {
    _loggedInUser = null;
    notifyListeners();
  }
}
