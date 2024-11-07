import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupproject/productDetail.dart';

class ProductCard extends StatelessWidget{
  String imageUrl;
  String nameproduct;
  String description;
  String price;

  ProductCard({
    required this.imageUrl,
    required this.nameproduct,
    required this.description,
    required this.price,
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // SingleChildScrollView(),
      onTap: (){
           Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                  imageUrl: imageUrl,
                  nameproduct: nameproduct,
                  description: description,
                  price: price,
                ),
              ),
            );
      } ,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding:  EdgeInsets.all(14),
          width: 200,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(imageUrl, height: 100, width: 150, fit: BoxFit.cover),
                  const Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                nameproduct,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
              Row(
                children:[ 
                  Text(
                    price,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Spacer(),
                  Positioned(
                    right: 8,
                    child: IconButton(
                      icon : const Icon(Icons.add_circle,
                      color: Colors.red,
                      size: 22),
                      onPressed: () { 
                        //  Navigator.pushNamed(context, '/panier');
                       },
                    ),  
                  ),
                ],
              )
            ],  
          ),
        ),
      )
    );
  }
  
  // Widget produit({required Column child}) {}

}

class ProductCardd extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // SingleChildScrollView(),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding:  EdgeInsets.all(14),
          width: 200,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset("images/chair.jpg", height: 120, width: 120, fit: BoxFit.cover),
                  const Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              const Text(
                "Chair",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
              Row(
                children:[ 
                  const Text(
                    "\$80.000",
                    style:  TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                    ),
                  ),
                 
                  Positioned(
                    right: 8,
                    child: IconButton(
                      icon : const Icon(Icons.add_circle,
                      color: Colors.red,
                      size: 22),
                      onPressed: () { 
                        //  Navigator.pushNamed(context, '/panier');
                       },
                    ),  
                  ),
                
                ],
              )
            
            ],  
          ),
        ),
      )
    );
  }
  
  // Widget produit({required Column child}) {}

}