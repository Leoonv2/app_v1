
import 'dart:convert';

import 'package:http/http.dart' as http;

class Product {
  int counter = 0;

  Future getProduct(barcode) async {
    
    final resp = await http.get( 
      // Uri.parse('http://192.168.137.1:3000/api/product?ean=$barcode'),
      Uri.parse('http://localhost:3000/api/product?ean=$barcode'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    
    return jsonDecode(resp.body);
  }
}
