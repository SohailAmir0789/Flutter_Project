import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiIntegration extends StatefulWidget {
  const ApiIntegration({super.key});

  @override
  State<ApiIntegration> createState() => _ApiIntegrationState();
}

class _ApiIntegrationState extends State<ApiIntegration> {
  Future fetchPosts() async {
    var url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    // print(await http.read(Uri.https('jsonplaceholder.typicode.com', 'posts')));
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FutureBuilder(
              future: fetchPosts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot);
                if (snapshot.hasData) {
                  var posts = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(posts[index]['title']),
                            subtitle: Text(posts[index]['body']),
                          );
                        }),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ],
      ),
    );
  }
}