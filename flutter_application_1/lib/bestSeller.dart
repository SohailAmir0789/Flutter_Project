import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

class Bestseller extends StatefulWidget {
  const Bestseller({super.key});

  @override
  State<Bestseller> createState() => _BestsellerState();
}

class _BestsellerState extends State<Bestseller> {
  final List<Map<String, dynamic>> gridMap = [
    {
      'title': 'Sunny Bruschetta',
      'description': 'Lorem ipsum dolor sit amet, consectetur...',
      'images': 'assets/images/pic1.png',
      'rating': '5.0',
      'price': '15.00'
    },
    {
      'title': 'Gourmet Grilled Skewers',
      'description': 'Lorem ipsum dolor sit amet, consectetur...',
      'images': 'assets/images/pic2.png',
      'rating': '5.0',
      'price': '12.00'
    },
    {
      'title': 'Barbecue tacos',
      'description': 'Lorem ipsum dolor sit amet, consectetur...',
      'images': 'assets/images/pic3.png',
      'rating': '4.0',
      'price': '20.00'
    },
    {
      'title': 'Broccoli lasagna',
      'description': 'Lorem ipsum dolor sit amet, consectetur...',
      'images': 'assets/images/pic4.png',
      'rating': '3.5',
      'price': '18.00'
    },
    {
      'title': 'Ice Cream Shake',
      'description': 'Lorem ipsum dolor sit amet, consectetur...',
      'images': 'assets/images/pic5.png',
      'rating': '3.0',
      'price': '11.00'
    },
    {
      'title': 'Red Velvet Cake',
      'description': 'Lorem ipsum dolor sit amet, consectetur...',
      'images': 'assets/images/pic6.png',
      'rating': '4.2',
      'price': '13.00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 203, 88, 1.000),
      body: Column(
        children: [
          // Top Background with Title
          Container(
            height: 110,
            color: Color.fromRGBO(245, 203, 88, 1.000),
            child: Center(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 100, 8),
                      child: Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                  ),
                  Text(
                    "Best Seller",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Grid List
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  itemCount: gridMap.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 280,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image.asset(
                              gridMap[index]['images'],
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 150,
                                  width: double.infinity,
                                  color: Colors.grey.shade300,
                                  child: Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  gridMap[index]['title'],
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  gridMap[index]['description'],
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.red),
                                      child: Row(
                                        children: [
                                          Text(
                                            gridMap[index]['rating'],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Icon(Icons.star,
                                              size: 15, color: Colors.amber),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.red,
                                      ),
                                      padding: EdgeInsets.all(6),
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.login_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: ""),
        ],
      ),
    );
  }
}
