import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = 'https://66efea01f2a8bce81be4849f.mockapi.io/Todo';

  // Get all TODOs
  Future<List<dynamic>> getAllTodo() async {
    var res = await http.get(Uri.parse(baseUrl));
    if (res.statusCode == 200) {
      List<dynamic> data = jsonDecode(res.body);
      print('TODO LIST: $data');
      return data;
    } else {
      throw Exception('Failed to fetch');
    }
  }

  // Add TODO
  Future<void> addTodo(String title, String desc) async {
    Map<String, dynamic> todo = {
      'title': title,
      'desc': desc,
    };
    var res = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(todo),
    );
    if (res.statusCode == 201) {
      print('Added TODO: ${res.body}');
    } else {
      throw Exception('Failed to add TODO');
    }
  }

  // Edit todo
  Future<void> editTodo(String id, String title, String desc) async {
    Map<String, dynamic> todo = {
      'title': title,
      'desc': desc,
    };
    var res = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(todo),
    );
    if (res.statusCode == 200) {
      print('Edited TODO: ${res.body}');
    } else {
      throw Exception('Failed to edit TODO');
    }
  }

  // Delete todo
  Future<void> deleteTodo(String id) async {
    var res = await http.delete(Uri.parse('$baseUrl/$id'));
    if (res.statusCode == 200) {
      print('Deleted TODO: ${res.body}');
    } else {
      throw Exception('Failed to delete TODO');
    }
  }
}
