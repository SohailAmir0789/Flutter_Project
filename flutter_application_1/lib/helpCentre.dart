import 'package:flutter/material.dart';
import 'package:flutter_application_1/Custom%20Widgets/Button.dart';

class Helpcentre extends StatefulWidget {
  const Helpcentre({super.key});

  @override
  State<Helpcentre> createState() => _HelpcentreState();
}

class _HelpcentreState extends State<Helpcentre> {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Help Centre",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "how can we help you?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Form Fields
            Container(
              height: MediaQuery.of(context).size.height * 0.80,
              width: double.infinity,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink.shade50,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            onPressed: () {},
                            child: Text("FAQ",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16)),
                          ),
                        ),
                        cusButton(text: "Contact Us")
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    cusRow(txt: "Customer", icn: Icons.headphones_outlined),
                    SizedBox(
                      height: 10,
                    ),
                    cusRow(txt: "Website", icn: Icons.web),
                    SizedBox(
                      height: 10,
                    ),
                    cusRow(txt: "WhatsApp", icn: Icons.chat),
                    SizedBox(
                      height: 10,
                    ),
                    cusRow(txt: "Facebook", icn: Icons.facebook_outlined),
                    SizedBox(
                      height: 10,
                    ),
                    cusRow(
                        txt: "Instagram", icn: Icons.social_distance_outlined),
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

class cusRow extends StatelessWidget {
  final String txt;
  final icn;
  const cusRow({super.key, required this.txt, required this.icn});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icn,
          size: 38,
          color: Colors.red,
        ),
        Text(
          txt,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.arrow_drop_down_outlined,
          size: 35,
          color: Colors.red,
        )
      ],
    );
  }
}
