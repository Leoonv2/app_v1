

class Product {
  Future registerProduct(barcode) async {
    
    // var http = HttpClient();
    // var resp = http
    //     .get('http://localhost', 8080, '/Product/$barcode');
    return '';
  }

  void searchProduct(barcode) async {
    final barcode0 = barcode;
    final url =
        'https://world.openfoodfacts.org/api/v0/product/$barcode0.json';
  }
}
