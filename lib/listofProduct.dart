import 'package:flutter/material.dart';
import 'package:groupproject/productCard.dart';
import 'package:groupproject/productDetail.dart';

class Product {
  String imageUrl;
  String nameproduct;
  String description;
  String price;

  Product({
    required this.imageUrl,
    required this.nameproduct,
    required this.description,
    required this.price,
  });
}

class ListOfProducts extends StatelessWidget {
  final List<Product> products = [
    Product(imageUrl: '../images/chair.jpg', nameproduct: 'White Chair', 
    description: 'This elegantly designed chair combines comfort and retro style. Its padded backrest and seat are covered in soft white fabric, providing optimal comfort. The wooden reclining legs add a warm and natural touch, while the angular structure gives a modern and refined look. ',
    price: '\$80.000'),
    Product(imageUrl: '../images/bed.jpg', nameproduct: 'Bed', 
    description: 'This elegantly designed chair combines comfort and retro style. Its padded backrest and seat are covered in soft white fabric, providing optimal comfort. The wooden reclining legs add a warm and natural touch, while the angular structure gives a modern and refined look. ',
    price: '\$150.000'),
    Product(imageUrl: '../images/room1.jpg', nameproduct: 'Room', 
    description: 'This elegantly designed chair combines comfort and retro style. Its padded backrest and seat are covered in soft white fabric, providing optimal comfort. The wooden reclining legs add a warm and natural touch, while the angular structure gives a modern and refined look. ',
    price: '\$250.000'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        return ProductCard(
          imageUrl: products[index].imageUrl,
          nameproduct: product.nameproduct,
          description: product.description,
          price: product.price,
          // onTap: () {
          //   // Navigate to ProductDetails view
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ProductDetails(
          //         imageUrl: product.imageUrl,
          //         nameproduct: product.nameproduct,
          //         description: product.description,
          //         price: product.price,
          //       ),
          //     ),
          //   );
          // },
        );
       },
      
    );
  }

  
  
}

// class ListProducts extends StatelessWidget {
//   final List<Product> products = [
//     Product(imageUrl: '../images/chair.jpg', nameproduct: 'White Chair', 
//     description: 'This elegantly designed chair combines comfort and retro style. Its padded backrest and seat are covered in soft white fabric, providing optimal comfort. The wooden reclining legs add a warm and natural touch, while the angular structure gives a modern and refined look. ',
//     price: '\$80.000'),
//     Product(imageUrl: '../images/bed.jpg', nameproduct: 'Bed', 
//     description: 'This elegantly designed chair combines comfort and retro style. Its padded backrest and seat are covered in soft white fabric, providing optimal comfort. The wooden reclining legs add a warm and natural touch, while the angular structure gives a modern and refined look. ',
//     price: '\$150.000'),
//     Product(imageUrl: '../images/room1.jpg', nameproduct: 'Room', 
//     description: 'This elegantly designed chair combines comfort and retro style. Its padded backrest and seat are covered in soft white fabric, providing optimal comfort. The wooden reclining legs add a warm and natural touch, while the angular structure gives a modern and refined look. ',
//     price: '\$250.000'),
//   ];
  
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: products.length,
//       itemBuilder: (BuildContext context, int index) {
//         final product = products[index];
//         return ProductCardd(
//           // onTap: () {
//           //   // Navigate to ProductDetails view
//           //   Navigator.push(
//           //     context,
//           //     MaterialPageRoute(
//           //       builder: (context) => ProductDetails(
//           //         imageUrl: product.imageUrl,
//           //         description: product.description,
//           //         price: product.price,
//           //       ),
//           //     ),
//           //   );
//           // },
//         );
//        },
      
//     );
//   }

  
  
// }