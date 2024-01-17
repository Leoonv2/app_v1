import 'package:http/http.dart' as http;

class Product {
  int counter = 0;

  Future<Map<String, dynamic>> getProduct(barcode, ind) async {
    var json1 = {
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

    var json2 = {
      "id": 2,
      "name": "Hanuta",
      "ean": "46728301",
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
    
    var json3 = {
      "id": 3,
      "name": "Milchschnitte",
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
    var jsonList = [json1, json2, json3];
    var json = jsonList[ind];
    return json;
  }
}
