import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:provider/provider.dart';
import 'package:formulariologin/providers/getproducts_provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:formulariologin/widgets/product_card.dart';
import 'package:formulariologin/models/product.dart';

class CardsProductos extends StatelessWidget {
  const CardsProductos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Productos> productos =
        Provider.of<GetProductosProvider>(context).listadoproductos;

    return Container(
        margin: EdgeInsets.only(bottom: 30),
        height: 450,
        width: double.infinity,
        child: ListView.builder(
            itemCount: productos.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (_, int indexProd) => ProductCard(
                  product: productos[indexProd],
                )));
  }
}
