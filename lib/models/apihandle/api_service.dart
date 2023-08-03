import 'dart:convert';
import 'package:http/http.dart' as http;

import 'cus_buy.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<List<Customer>> fetchCustomers() async {
    final response = await http.get(Uri.parse('$baseUrl/customers'));

    if (response.statusCode == 200) {
      List<dynamic> customersJson = jsonDecode(response.body);
      return customersJson.map((json) => Customer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch customers');
    }
  }

  Future<Customer> fetchCustomerById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/customers/$id'));

    if (response.statusCode == 200) {
      dynamic customerJson = jsonDecode(response.body);
      return Customer.fromJson(customerJson);
    } else {
      throw Exception('Failed to fetch customer');
    }
  }
}
