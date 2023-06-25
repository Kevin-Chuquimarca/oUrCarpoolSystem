import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../domain/product.dart';

class HttpMethods {
  Future<Product> fetchPost() async {
    Uri url = Uri.parse('http://192.168.55.219:8080/product/1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
