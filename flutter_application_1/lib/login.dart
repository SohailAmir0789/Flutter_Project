import 'package:flutter/material.dart';
import 'package:flutter_application_1/Custom%20Widgets/Button.dart';
import 'package:flutter_application_1/Custom%20Widgets/TextField.dart';
import 'package:flutter_application_1/InfoScreen.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  "Log In",
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
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Welcome",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Email or Phone Number",
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Forget Password?",
                            style: TextStyle(color: Colors.red)),
                      ),
                    ),
                    const SizedBox(height: 50),
                    // Login Button
                    cusButton(
                      text: "Login",
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup()));
                              },
                              child: Text(" Sign Up")),
                        ],
                      ),
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

// Custom Input Field Widget
