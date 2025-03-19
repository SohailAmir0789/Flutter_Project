import 'package:flutter/material.dart';
import 'package:flutter_application_1/Custom%20Widgets/Button.dart';
import 'package:flutter_application_1/Custom%20Widgets/TextField.dart';
import 'package:flutter_application_1/InfoScreen.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 203, 88, 1.000),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Background with Title
            Container(
              height: 110,
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 203, 88, 1.000),
              ),
              child: Center(
                child: Text(
                  "New Account",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Form Fields
            Container(
              height: 800,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Full Name",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextField(),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Password",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextField(isPassword: true),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Email",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextField(),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Mobile Number",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextField(),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Date of Birth",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CustomTextField(),

                    const SizedBox(height: 10),
                    const SizedBox(height: 50),
                    // Login Button
                    cusButton(
                      text: "Sign up",
                      screen: () => Home(),
                    ),
                    const SizedBox(height: 20),
                    // Social Media Login

                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => InfoScreen()));
                      },
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text("Already have an account? Login")),
                    ),
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
          NavigationDestination(icon: Icon(Icons.favorite_outline), label: ""),
          NavigationDestination(
              icon: Icon(Icons.checklist_outlined), label: ""),
          NavigationDestination(icon: Icon(Icons.info_outline), label: ""),
        ],
        backgroundColor: Colors.red,
      ),
    );
  }
}
