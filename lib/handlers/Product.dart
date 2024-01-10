import 'dart:convert';
import 'package:http/http.dart' as http;



class Product {
  Future<String> getProduct(barcode) async {
    final resp = await http.get(
      Uri.parse('http://localhost:3000/product?id=$barcode'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(resp.body);
    // make an get request to localhost:3000/getProduct with the param ean = barcode

    var json = {
      "id": 1,
      "name": "Knoppers",
      "ean": "0000040144382",
      "nutrients": {
        "update": {
          "fat": 33.2,
          "salt": 0.56,
          "carbs": 51.3,
          "sugar": 34.6,
          "protein": 9.2,
          "calories": 548
        }
      },
      "createdAt": "2024-01-09T13:40:33.556Z",
      "updatedAt": "2024-01-09T14:20:41.621Z"
    };
    // final product = jsonDecode(json);
    print(json['name'] as String);
    return json['name'] as String;
  }

  void searchProductAPI(barcode) async {
    final barcode0 = barcode;
    final url = 'https://world.openfoodfacts.org/api/v0/product/$barcode0.json';
  }
}
