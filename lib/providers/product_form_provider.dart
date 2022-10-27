import 'package:flutter/material.dart';
import 'package:formulariologin/models/product.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  //late
  Productos product =
      new Productos(available: false, name: '', picture: '', price: 0, id: '');

  //late Productos product;

// this.product
  ProductFormProvider();

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