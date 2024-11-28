import 'dart:convert';
import 'dart:io';

import 'package:food_order_test/constants/constants.dart';
import 'package:http/http.dart' as http;

class OrderService {
  OrderService();

  Future getCategory() async {
    final response = await http.get(
      Uri.parse('${KConstant.productionUrl}/categories.php'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw response.body;
    }
  }

  Future getMenuByCategory(String category) async {
    final response = await http.get(
      Uri.parse('${KConstant.productionUrl}/filter.php?c=$category'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw response.body;
    }
  }
}
