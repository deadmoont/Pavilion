import 'package:flutter/material.dart';


class Merchscreen extends StatelessWidget {
  const Merchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back , color: Colors.white),),
        title: Text(
          'Merch',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0xFF3B150E),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3B150E), // Light red at the top
              Color(0xFF1A0C08), // Black at the bottom
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 46),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ProductCard(
                title: 'Black Solid Hooded Sweatshirt',
                subtitle: 'Hoodie',
                price: '₹850',
                imagePath: 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/merch%2Fdocument%201%2Feffervesce_merchandise.jpg?alt=media&token=7040c5ea-e730-4d6c-9364-590da3930b5e', // Replace with actual image path
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ProductCard(
                title: 'Pullover',
                subtitle: 'Pullover',
                price: '₹850',
                imagePath: 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/merch%2Fdocument%202%2Feffervesce_merchandise_hoodie2.jpg?alt=media&token=5b42931d-cd48-462d-9a8a-1885d27e5634', // Replace with actual image path
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imagePath;

  const ProductCard({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              imagePath,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.orange.shade400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}