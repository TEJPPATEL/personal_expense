import 'dart:convert';

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json["userId"],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> toJson() {
    return { "userId" : userId , "id" : id , "title" : title , "body" : body };
  }

  String toString() {
    return "Post {userid : $userId , id : $id , title : $title , body : $body}";
  }

}


List<Post> postfromJson(String jsondata) {
  final data = json.decode(jsondata);
  return List<Post>.from(data.map((item) => Post.fromJson(item)));
}