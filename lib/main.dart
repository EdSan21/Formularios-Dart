import 'package:flutter/material.dart';
import 'package:formulariologin/screen/editarproducto.dart';
import 'package:formulariologin/screen/login_screen.dart';
import 'package:formulariologin/screen/home_screen.dart';
import 'package:formulariologin/screen/producto_screen.dart';
import 'package:formulariologin/screen/formnewproduct.dart';
import 'package:formulariologin/screen/test_screen.dart';
import 'package:formulariologin/ui/infinite_package.dart';
import 'package:formulariologin/ui/scroll.dart';
import '../models/product.dart';
import 'package:provider/provider.dart';
import 'package:formulariologin/providers/product_form_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final productProvider = Provider.of<ProductFormProvider>(context);
    // final Productos productos;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Productos App Demo',
        initialRoute: 'login',
        routes: {
          'login': (__) => LoginScreen(),
          'home': (__) => HomeScreen(),
          'productos': (__) => ProductoScreen(),
          'nuevoproducto': (__) => FormNewProduct(),
          'editarproducto': (__) => FormEditarProduct(),
          'catalogoinfinito': (__) => HomePage(),
          //'listado_producto': (__) => CardScreen(),
        },
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: Colors.grey[300]));
  }
}
