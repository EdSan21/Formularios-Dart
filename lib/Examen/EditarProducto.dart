import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'db.dart';

class EditarProducto extends StatefulWidget {
  int codigo;
  EditarProducto({required this.codigo}); //constructor for class

  @override
  State<StatefulWidget> createState() {
    return _EditarProducto();
  }
}

class _EditarProducto extends State<EditarProducto> {
  TextEditingController name = TextEditingController();
  TextEditingController codigo = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController available = TextEditingController();
  MyDb mydb = new MyDb();

  @override
  void initState() {
    mydb.open();

    Future.delayed(Duration(milliseconds: 500), () async {
      var data = await mydb.getStudent(
          widget.codigo); //widget.rollno is passed paramater to this class
      if (data != null) {
        name.text = data["name"];
        codigo.text = data["codigo"].toString();
        price.text = data["price"].toString();
        available.text = data["available"].toString();
        setState(() {});
      } else {
        print("No any data with roll no: " + widget.codigo.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Editar Producto"),
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
                  hintText: "Precio",
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    mydb.db?.rawInsert(
                        "UPDATE students SET name = ?, codigo = ?, price = ?, available = ? WHERE codigo = ?",
                        [
                          name.text,
                          codigo.text,
                          price.text,
                          available.text,
                          widget.codigo
                        ]);
                    //update table with roll no.
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Student Data Updated")));
                  },
                  child: Text("Update Student Producto")),
            ],
          ),
        ));
  }
}
