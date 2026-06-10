import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'payment_page.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productName;
  final String price;
  final String image;
  final String location;

  const ProductDetailsPage({
    super.key,
    required this.productName,
    required this.price,
    required this.image,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Product Details"),
        centerTitle: true,
        backgroundColor: const Color(0xffFF6F00),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Image.network(
              image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "4.8 Rating",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Divider(),

                  const Text(
                    "Product Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "$productName is available at an affordable price. High quality product with fast delivery and reliable service.",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Divider(),

                  const Text(
                    "Seller Information",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ListTile(
                    leading:
                        const Icon(Icons.store),
                    title: const Text(
                      "Shop Owner",
                    ),
                    subtitle: const Text(
                      "Verified Business",
                    ),
                  ),

                  ListTile(
                    leading: const Icon(
                      Icons.location_on,
                    ),
                    title:
                        const Text("Location"),
                    subtitle: Text(location),
                  ),

                  ListTile(
                    leading:
                        const Icon(Icons.phone),
                    title:
                        const Text("Contact"),
                    subtitle: const Text(
                      "+234XXXXXXXXXX",
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      icon:
                          const Icon(Icons.chat),
                      label: const Text(
                        "CHAT OWNER",
                      ),
                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.blue,
                        foregroundColor:
                            Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const ChatPage(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.shopping_cart,
                      ),
                      label: const Text(
                        "BUY NOW",
                      ),
                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(
                                0xffFF6F00),
                        foregroundColor:
                            Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    const PaymentPage(),
                          ),
                        );
                      },
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