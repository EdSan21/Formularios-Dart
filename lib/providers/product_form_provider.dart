import 'package:flutter/material.dart';
import 'package:formulariologin/models/product.dart';
//late
//Productos product = new Productos(available: false, name: '', picture: '', price: 0, id: '');

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  late Productos product;

// this.product
  ProductFormProvider(this.product);

  UpdateAvailability(bool value) {
    print(value);
    this.product.available = value;
    notifyListeners();
  }

  bool? isValidForm() {
    print(product.name);
    print(product.price);
    print(product.available);
    return formKey.currentState?.validate();
  }
}
