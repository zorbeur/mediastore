import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> produit;

  const ProductDetailScreen({super.key, required this.produit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(produit['nom'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: produit['imageUrl'] != null
                  ? Image.network(
                produit['imageUrl'],
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 100);
                },
              )
                  : const Icon(Icons.image, size: 100),
            ),
            const SizedBox(height: 20),
            Text(
              produit['nom'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Catégorie : ${produit['categorie']}",
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              "Prix : ${produit['prix']} FCFA",
              style: const TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              produit['disponible'] ? "Disponible" : "Indisponible",
              style: TextStyle(
                fontSize: 18,
                color: produit['disponible'] ? Colors.blue : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: produit['disponible'] ? () {} : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.orange,
                ),
                child: const Text("Louer cet instrument", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
