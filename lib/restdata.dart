import 'dart:convert';
import 'package:Expense/model/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestData extends StatefulWidget {
  @override
  _RestDataState createState() => _RestDataState();
}

class _RestDataState extends State<RestData> {
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
    print("hey");
    print(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fetch REST API"),
        ),
        body: Center(
            child: FutureBuilder<Post>(
          future: post,
          builder: (context, abc) {
            print(abc);
            if (abc.hasData) {
              return Text(abc.data.title);
            } else if (abc.hasError) {
              return Text("${abc.error}");
            }

            // By default, it show a loading spinner.
            return CircularProgressIndicator();
          },
        )));
  }
}

Future<Post> fetchPost() async {
  final response = await http.get("https://jsonplaceholder.typicode.com/posts");
  final jsonresponse = json.decode(response.body);
  // print(response.body);
  if (response.statusCode == 200) {
    return Post.fromJson(jsonresponse[0]);
  } else {
    // If that call was not successful (response was unexpected), it throw an error.
    throw Exception('Failed to load post');
  }
}


// Future<Post> setPost(userId, id, title, name) async () {
//   final response = await http.Post("https://jsonplaceholder.typicode.com/posts" , body : )

// }