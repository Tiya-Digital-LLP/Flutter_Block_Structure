import 'dart:convert';
import 'package:blockstructure/core/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:blockstructure/core/models/user_model.dart';

class ApiProvider {
  Future<List<User>> fetchUsers() async {
    // Use mock data for now
    final response = await Future.delayed(Duration(seconds: 1), () {
      return http.Response(
        jsonEncode([
          {"id": 1, "name": "John", "email": "john@example.com"},
          {"id": 2, "name": "Jane", "email": "jane@example.com"},
        ]),
        200,
      );
    });

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<List<Post>> fetchPosts() async {
    // Use mock data for now
    final response = await Future.delayed(Duration(seconds: 1), () {
      return http.Response(
        jsonEncode([
          {"id": 1, "title": "Post One", "body": "This is the first post."},
          {"id": 2, "title": "Post Two", "body": "This is the second post."},
        ]),
        200,
      );
    });

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load posts");
    }
  }
}
