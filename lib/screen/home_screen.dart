import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
export 'package:formulariologin/screen/screens.dart';
import 'package:formulariologin/widgets/auth_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Prueba(),
    );
  }
}

class Prueba extends StatelessWidget {
  const Prueba({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 68, 68),
      appBar: AppBar(
        title: Text('Menú'),
        backgroundColor: Color.fromARGB(255, 255, 68, 68),
      ),
      body: AuthBackgroundHome(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "nuevoproducto");
                },
                color: Color.fromARGB(240, 77, 148, 27),
                child: Text(
                  'Nuevo Producto',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "productos");
                },
                color: Color.fromARGB(241, 61, 126, 14),
                child: Text(
                  'Catálogo ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "login");
                },
                color: Color.fromARGB(240, 77, 148, 27),
                child: Text(
                  'Cerrar Sesión',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Menú'),
          backgroundColor: Color.fromARGB(255, 255, 68, 68),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                // FlatButton(
                //   onPressed: () {
                //     Navigator.pushReplacementNamed(context, "login");
                //   },
                //   color: Color.fromARGB(255, 255, 68, 68),
                //   child: Text(
                //     'Cerrar Sesión',
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
                SizedBox(height: 30),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "login");
                  },
                  child: Icon(Icons.logout_outlined),
                  tooltip: "Logout",
                  hoverColor: Color.fromARGB(241, 61, 126, 14),
                  backgroundColor: Color.fromARGB(242, 90, 199, 12),
                ),
                Container(
                  child: Text(
                    "Cerrar Sesión",
                  ),
                ),
                SizedBox(height: 30),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "producto");
                  },
                  child: Icon(Icons.shopping_bag_outlined),
                  tooltip: "New Product",
                  hoverColor: Color.fromARGB(241, 61, 126, 14),
                  backgroundColor: Color.fromARGB(242, 90, 199, 12),
                ),
                Container(
                  child: Text(
                    "Nuevo Producto",
                  ),
                ),
                SizedBox(height: 30),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "listado_producto");
                  },
                  child: Icon(Icons.list_alt_outlined),
                  tooltip: "Listado de Productos",
                  hoverColor: Color.fromARGB(241, 61, 126, 14),
                  backgroundColor: Color.fromARGB(242, 90, 199, 12),
                ),
                Container(
                  child: Text(
                    "Catálogo",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
