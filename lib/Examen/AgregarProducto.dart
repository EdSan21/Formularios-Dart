import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formulariologin/Examen/db.dart';

class AgregarProducto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AgregarProducto();
  }
}

class _AgregarProducto extends State<AgregarProducto> {
  TextEditingController name = TextEditingController();
  TextEditingController codigo = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController available = TextEditingController();
  //test editing controllers for form

  MyDb mydb = new MyDb(); //mydb new object from db.dart

  @override
  void initState() {
    mydb.open(); //initilization database

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agregar Producto"),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Nombre Producto",
                ),
              ),
              TextField(
                controller: codigo,
                decoration: InputDecoration(
                  hintText: "Código",
                ),
              ),
              TextField(
                controller: price,
                decoration: InputDecoration(
                  hintText: "Precio",
                ),
              ),
              TextField(
                controller: available,
                decoration: InputDecoration(
                  hintText: "Disponible",
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    mydb.db?.rawInsert(
                        "INSERT INTO productos (name, codigo, price, available) VALUES (?, ?, ?, ?);",
                        [
                          name.text,
                          codigo.text,
                          price.text,
                          available.text
                        ]); //add student from form to database

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Nuevo Producto Agregado")));
                    //show snackbar message after adding student

                    name.text = "";
                    codigo.text = "";
                    price.text = "";
                    available.text = "";
                    //clear form to empty after adding data
                  },
                  child: Text("Producto Registrado")),
            ],
          ),
        ));
  }
}
