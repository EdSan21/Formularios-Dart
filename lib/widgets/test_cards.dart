import 'package:flutter/material.dart';

import '../models/models.dart';

class TestoCard extends StatelessWidget {
  const TestoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 150),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(
                "https://walmartgt.vtexassets.com/arquivos/ids/243828/Cloro-Suli-1892Ml-1-34162.jpg?v=637798992359300000"),
            _ProductDetails(
                title: 'Color Suli', subtitle: "Artículos de Limpieza"),
            Positioned(top: 0, right: 0, child: _PriceTag(5.75)),
            if (!true) Positioned(top: 0, right: 0, child: _NotAvailabe()),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _cardBorders() => BoxDecoration(
        color: Color.fromARGB(255, 135, 93, 126),
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
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Color.fromARGB(255, 117, 30, 100),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}

class _PriceTag extends StatelessWidget {
  final double price;
  const _PriceTag(this.price);

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
          color: Color.fromARGB(255, 100, 24, 85),
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
