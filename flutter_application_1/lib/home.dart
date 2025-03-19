import 'package:flutter/material.dart';
import 'package:flutter_application_1/Custom%20Widgets/carousel.dart';
import 'package:flutter_application_1/aois/apis.dart';
import 'package:flutter_application_1/bestSeller.dart';
import 'package:flutter_application_1/helper/pref.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> circleItems = [
    {'title': 'Snacks', 'images': 'assets/images/Snacks.png'},
    {'title': 'Meal', 'images': 'assets/images/Meals.png'},
    {'title': 'Vegan', 'images': 'assets/images/Vegan.png'},
    {'title': 'Dessert', 'images': 'assets/images/Desserts.png'},
    {'title': 'Drinks', 'images': 'assets/images/Drinks.png'},
  ];

  final List<Map<String, dynamic>> squareItems = [
    {'price': '103.0', 'images': 'assets/images/img1.png'},
    {'price': '50.0', 'images': 'assets/images/img2.png'},
    {'price': '12.99', 'images': 'assets/images/img3.png'},
    {'price': '8.20', 'images': 'assets/images/img4.png'},
  ];
  @override
  void initState() {
    // TODO: implement initState
    Pref.showOnboarding = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    APIs.getAnswer('hi');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(245, 203, 88, 1.000),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        height: 30,
                        width: 230,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Search",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.red,
                      size: 28,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Colors.red,
                      size: 28,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Icon(
                      Icons.person_2_outlined,
                      color: Colors.red,
                      size: 28,
                    ),
                  )
                ],
              ),
              // Top Background with Title
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Good Morning",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Rise and shine! It's breakfast time",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Form Fields
              Container(
                // Remove the fixed height for better layout handling
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Use Flexible or remove the expanded approach
                      // ListView.builder should take up only the space it needs
                      SizedBox(
                        height: 100, // Set a specific height
                        child: ListView.builder(
                          itemCount: circleItems.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 65, // Circular height
                                    width: 65, // Circular width
                                    decoration: BoxDecoration(
                                      color: Colors.yellow.shade100,
                                      shape: BoxShape
                                          .circle, // Ensure the container is circular
                                    ),
                                    child: ClipOval(
                                      child: Image.asset(
                                        circleItems[index]['images'],
                                        height: 120,
                                        width: 120,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    circleItems[index]['title'],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      // Row for the texts
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Best Seller",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Bestseller()));
                            },
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Bestseller()));
                                  },
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 15,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: squareItems.length,
                          itemBuilder: (context, index) {
                            return FoodItem(
                              imageUrl: squareItems[index]['images'],
                              price: squareItems[index]['price'],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CarouselBanner(),
                      Row(
                        children: [
                          Text(
                            "Recommend",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: "",
            ),
            NavigationDestination(icon: Icon(Icons.login_outlined), label: ""),
            NavigationDestination(
                icon: Icon(Icons.favorite_outline), label: ""),
            NavigationDestination(
                icon: Icon(Icons.checklist_outlined), label: ""),
            NavigationDestination(icon: Icon(Icons.info_outline), label: ""),
          ],
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final String imageUrl;
  final String price;

  const FoodItem({required this.imageUrl, required this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageUrl,
              width: 70,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '\$$price',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
