import 'package:flutter/material.dart';
import 'package:formulariologin/models/models.dart';
import 'package:formulariologin/providers/product_form_provider.dart';
import 'package:formulariologin/widgets/auth_background.dart';
import 'package:formulariologin/widgets/card_container.dart';
import 'package:formulariologin/widgets/product_card.dart';
// import 'package:formulariologin/screen/screens.dart';
import 'package:formulariologin/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({Key? key, required this.productos}) : super(key: key);
  final Productos productos;
  @override
  Widget build(BuildContext context) {
    return Container(child: ProductCard(product: productos));
  }
}
