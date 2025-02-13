import 'package:flutter/material.dart';
import 'package:mediastore/core/services/api_service.dart';

class InstrumentProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<dynamic> _produits = [];

  List<dynamic> get produits => _produits;

  Future<void> loadProduits() async {
    try {
      _produits = await _apiService.fetchProduits();
      notifyListeners();
    } catch (e) {
      print("Erreur lors du chargement des produits: $e");
    }
  }
}
