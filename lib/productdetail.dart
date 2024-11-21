import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Display product image
            Center(
              child: Image.asset(
                product['image'],
                height: 250.0,
                width: 250.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            // Display product title
            Text(
              product['title'],
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            // Display product price
            Text(
              product['subtitle'],
              style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
