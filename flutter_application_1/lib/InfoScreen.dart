import 'package:flutter/material.dart';
import 'package:flutter_application_1/Custom%20Widgets/Button.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 203, 88, 1.000), // Background color
      body: Stack(
        children: [
          // Top Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/pizza.png', // Replace with your image
              height: MediaQuery.of(context).size.height * 0.60,
              fit: BoxFit.cover,
            ),
          ),
          // Skip Button
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          // Bottom Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.45,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("assets/images/icon.png")),
                  const SizedBox(height: 20),
                  Text(
                    "Order For Food",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Lorem ipsum dolor sit amet, conse ctetur \n  adipiscing elit, sed do eiusmod tempor \n incididunt ut labore et dolore magna.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  cusButton(
                    text: "Next",
                    screen: () => Login(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
