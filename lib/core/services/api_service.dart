import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://10.0.203.50:5087/api";

  // Récupérer la liste des produits
  Future<List<dynamic>> fetchProduits() async {
    final response = await http.get(Uri.parse('$baseUrl/produits'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Échec du chargement des produits");
    }
  }
}
