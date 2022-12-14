import 'package:flutter/cupertino.dart';
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
            Container(child: BtnOnOff()),
            _ProductDetails(title: product.name, subtitle: product.id),
            Positioned(
                top: 0, right: 0, child: _PriceTag(price: product.price)),
            // Container(
            //   child: BtnCrear(),
            //   margin: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
            // ),

            // Container(
            //   child: BtnActualizar(),
            //   margin: EdgeInsets.symmetric(horizontal: 13, vertical: 2),
            // ),

            // Container(
            //   child: BtnOnOff(),
            //   margin: EdgeInsets.symmetric(horizontal: 140),
            // ),
            Container(
                width: 40,
                margin: EdgeInsets.symmetric(horizontal: 17, vertical: 40),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  floatingActionButton: FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Color.fromARGB(255, 100, 147, 11),
                    child: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => AlertDialog(
                                  title: Text("ALERTA"),
                                  content:
                                      Text("??Desea eliminar este producto?"),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop('No');
                                        },
                                        child: Text('No')),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop('Si');
                                        },
                                        child: Text('Si')),
                                  ]));
                    },
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.endFloat,
                )
                //child: BtnOnOff(),
                //margin: EdgeInsets.symmetric(horizontal: 160),
                //margin: EdgeInsets.symmetric(horizontal: 0, vertical: 200),
                //    ),

                // if (!product.available)
                //   Positioned(top: 0, right: 0, child: _NotAvailabe())
                )
          ],
        ),
      ),
    );
  }
}

class BtnOnOff extends StatelessWidget {
  const BtnOnOff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            onPressed: () {
              //Navigator.pushReplacementNamed(context, "nuevoproducto");
            },
            height: 20,
            color: Color.fromARGB(255, 181, 52, 52),
            child: Text(
              'Off',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
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
            color: Color.fromARGB(255, 183, 33, 68),
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
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                          title: Text("ALERTA"),
                          content: Text("??Desea eliminar este producto?"),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop('No');
                                },
                                child: Text('No')),
                            FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop('Si');
                                },
                                child: Text('Si')),
                          ]));

              //Navigator.pushReplacementNamed(context, "nuevoproducto");
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
            //quitar la palabra assets ya que al dejarla entonces la direcci??n seri??:
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
            BtnActualizar(),
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


// Scaffold(
//               body: Center(),
//               floatingActionButton:
//                   Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
//                 FloatingActionButton(
//                   onPressed: () {
//                     Navigator.pushReplacementNamed(context, "nuevoproducto");
//                   },
//                   child: Icon(Icons.plus_one),
//                   backgroundColor: Color.fromARGB(255, 220, 72, 23),
//                 ),
//                 FloatingActionButton(
//                   onPressed: () {
//                     Navigator.pushReplacementNamed(context, "editarproducto");
//                   },
//                   child: Icon(Icons.edit_note),
//                   backgroundColor: Color.fromARGB(255, 84, 153, 44),
//                 ),
//                 FloatingActionButton(
//                   onPressed: () {
//                     showDialog(
//                         context: context,
//                         barrierDismissible: false,
//                         builder: (context) => AlertDialog(
//                                 title: Text("ALERTA"),
//                                 content: Text("??Desea eliminar este producto?"),
//                                 actions: <Widget>[
//                                   FlatButton(
//                                       onPressed: () {
//                                         Navigator.of(context).pop('No');
//                                       },
//                                       child: Text('No')),
//                                   FlatButton(
//                                       onPressed: () {
//                                         Navigator.of(context).pop('Si');
//                                       },
//                                       child: Text('Si')),
//                                 ]));
//                   },
//                   child: Icon(Icons.delete),
//                   backgroundColor: Colors.blueGrey,
//                 ),
//                 FloatingActionButton(
//                   onPressed: () {
//                     Navigator.pushReplacementNamed(context, "home");
//                   },
//                   child: Icon(Icons.code_off_sharp),
//                   backgroundColor: Color.fromARGB(255, 35, 68, 84),
//                 ),
//               ]),
//               backgroundColor: Colors.transparent,
//             )