import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Apitest extends StatelessWidget {
  const Apitest({super.key});

  getPostApi() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    print(responseBody[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                getPostApi();
              },
              child: Text("Sohail"))),
    );
  }
}
