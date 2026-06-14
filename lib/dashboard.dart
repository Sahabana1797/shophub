import 'package:flutter/material.dart';
import 'package:shophub/add_product.dart'; 
import 'product_details.dart';
import 'profile_page.dart';

class Dashboard extends StatelessWidget {
  final bool isBusinessOwner;

  const Dashboard({
    super.key,
    this.isBusinessOwner = false,
  });

  Widget productCard(
    BuildContext context,
    String name,
    String price,
    String image,
    String location,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              productName: name,
              price: price,
              image: image,
              location: location,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                child: Image.network(
                  image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(location, style: const TextStyle(color: Colors.grey)),

                  const SizedBox(height: 5),

                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 5),
                      Text("4.8"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

     appBar: AppBar(
  automaticallyImplyLeading: false,
  actions: [
    IconButton(
      icon: const Icon(Icons.person),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfilePage(),
          ),
        );
      },
    ),
  ],
  backgroundColor: const Color(0xffFF6F00),
  foregroundColor: Colors.white,
  title: const Text("The ShopHub"),
  centerTitle: true,
),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xffFF6F00),
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search products...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://images.unsplash.com/photo-1556740749-887f6717d7e4",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular Products",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 10),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              padding: const EdgeInsets.all(10),

              children: [
                productCard(
                  context,
                  "Indomie Carton",
                  "₦18,000",
                  "https://images.unsplash.com/photo-1585032226651-759b368d7246",
                  "Dugbe Market",
                ),

                productCard(
                  context,
                  "Rice 50kg",
                  "₦85,000",
                  "https://images.unsplash.com/photo-1586201375761-83865001e31c",
                  "Bodija Market",
                ),

                productCard(
                  context,
                  "Peak Milk",
                  "₦5,000",
                  "https://images.unsplash.com/photo-1563636619-e9143da7973b",
                  "Oje Market",
                ),

                productCard(
                  context,
                  "Solar Inverter",
                  "₦450,000",
                  "https://images.unsplash.com/photo-1509391366360-2e959784a276",
                  "Challenge Market",
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: isBusinessOwner
    ? FloatingActionButton(
        backgroundColor: const Color(0xffFF6F00),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const AddProductPage(),
            ),
          );
        },
      )
    : null,
    );
  }
}