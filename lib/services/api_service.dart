import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1'));

      print('STATUS CODE: ${response.statusCode}');
      print('BODY: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List users = data['data'];
        return users.map((u) => User.fromJson(u)).toList();
      } else {
        throw Exception('Gagal mengambil data: status ${response.statusCode}');
      }
    } catch (e) {
      print('ERROR: $e');
      throw Exception('Gagal mengambil data: $e');
    }
  }
}
