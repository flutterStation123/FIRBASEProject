import 'package:flutter/material.dart';
class ProductDetails extends StatelessWidget{
  String imageUrl;
  String nameproduct;
  String description;
  String price;

  ProductDetails({
    required this.imageUrl,
    required this.nameproduct,
    required this.description,
    required this.price,
  });

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Material(
              elevation: 4,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60), 
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nameproduct,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 229, 115, 115),
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    const SizedBox(height: 16), // Space before the description
                    Text(
                      description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20), 
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your booking action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade300, // Background color
                          foregroundColor: Colors.white, // Text color
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                        ),
                        child: const 
                        Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}