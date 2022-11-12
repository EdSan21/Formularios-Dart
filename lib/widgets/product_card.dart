import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/product_service.dart';

class ProductCard extends StatelessWidget {
  final Productos product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(product.picture),
            _ProductDetails(title: product.name, subtitle: product.id),
            Positioned(
                top: 0, right: 0, child: _PriceTag(price: product.price)),
            Container(
              child: BtnCrear(),
              // margin: EdgeInsets.symmetric(horizontal: 8),
            ),

            Container(
              child: BtnActualizar(),
              margin: EdgeInsets.symmetric(horizontal: 75),
            ),

            Container(
              child: BtnBorrar(),
              margin: EdgeInsets.symmetric(horizontal: 150),
            ),

            // if (!product.available)
            //   Positioned(top: 0, right: 0, child: _NotAvailabe())
          ],
        ),
      ),
    );
  }
}

class BtnCrear extends StatelessWidget {
  const BtnCrear({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "nuevoproducto");
            },
            height: 20,
            color: Color.fromARGB(255, 207, 93, 52),
            child: Text(
              'Crear',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class BtnActualizar extends StatelessWidget {
  const BtnActualizar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "editarproducto");
            },
            height: 20,
            color: Color.fromARGB(255, 96, 157, 52),
            child: Text(
              'Editar',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class BtnBorrar extends StatelessWidget {
  const BtnBorrar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "nuevoproducto");
            },
            height: 20,
            minWidth: 2.5,
            color: Color.fromARGB(255, 185, 26, 145),
            child: Text(
              'Borrar',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
        ]);

class _BackgroundImage extends StatelessWidget {
  final String? url;
  const _BackgroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: url == null
            //quitar la palabra assets ya que al dejarla entonces la dirección seriá:
            //assets/assets/...
            ? Image(image: AssetImage('no-image.png'), fit: BoxFit.cover)
            : FadeInImage(
                placeholder: AssetImage('jar-loading.gif'),
                image: NetworkImage(url!),
                fit: BoxFit.cover),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String title; //props
  final String subtitle;
  const _ProductDetails({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.indigo,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}

class _PriceTag extends StatelessWidget {
  final double price;
  const _PriceTag({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('\Q$price',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
      alignment: Alignment.center,
    );
  }
}

class _NotAvailabe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('NO disponible',
                  style: TextStyle(color: Colors.white, fontSize: 20))),
        ),
        width: 100,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
        ));
  }
}
