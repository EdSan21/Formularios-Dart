import 'dart:async';
import 'package:formulariologin/models/product.dart';
import 'package:formulariologin/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GetProductosProvider extends ChangeNotifier {
  String _baseUrl = 'forms-flutter-b2e26-default-rtdb.firebaseio.com';

  List<Productos> listadoproductos = [];

  GetProductosProvider() {
    this.getProductos();
  }

  Future<String> _getJsonData(String _endpoint) async {
    final _url = Uri.https(_baseUrl, _endpoint);
    final response = await http.get(_url);
    return response.body;
  }

  getProductos() async {
    final jsonData = await this._getJsonData('/productos.json');
    final prodcs = prodsFromJson(jsonData);
    listadoproductos = prodcs;
    notifyListeners();
  }
}
