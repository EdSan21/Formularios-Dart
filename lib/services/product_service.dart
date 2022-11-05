import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/models.dart';
import 'package:formulariologin/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl =
      'https://forms-flutter-b2e26-default-rtdb.firebaseio.com/';
  final List<Productos> products = []; //arreglo o lista vacia
  late Productos selectedProducts;

  File? newPictureFile;
  bool isLoading = true;
  bool isSaving = false;

  ProductService() {
    this.loadProducts();
  }

  Future<List<Productos>> loadProducts() async {
    this.isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'productos.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Productos.fromJson(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });
    this.isLoading = false;
    notifyListeners();
    return this.products;
  }

  Future saveOrCreateProduct(Productos product) async {
    isSaving = true;
    notifyListeners();
    if (product.id == null) {
      await this.CreateProduct(product);
    } else {
      await this.UpdateProdut(product);
    }
    isSaving = false;
    notifyListeners();
  }

  Future<String> UpdateProdut(Productos products) async {
    final url = Uri.https(_baseUrl, 'productos/${products.id}.json');
    final resp = await http.put(url, body: products.toJson());
    final decodeData = resp.body;
    //actualizar prods
    final index =
        this.products.indexWhere((element) => element.id == products.id);
    this.products[index] = products;
    return products.id!;
  }

  Future<String> CreateProduct(Productos products) async {
    final url = Uri.https(_baseUrl, 'productos.json');
    final resp = await http.post(url, body: products.toJson());
    final decodeData = json.decode(resp.body);
    products.id = decodeData['name'];
    this.products.add(products);
    return products.id!;
  }

  void updateSelectProductImage(String path) {
    this.selectedProducts.picture = path;
    this.newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (this.newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners(); //actualizar pantalla

    final url = Uri.parse('url to upload file');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);
    imageUploadRequest.files.add(file);
    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Unexpected server error');
      print(resp.body);
      return null;
    }
    this.newPictureFile = null;
    final decodeData = json.decode(resp.body);
    return decodeData["secure_url"];
  }
}
