import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formulariologin/Examen/EditarProducto.dart';
import 'package:formulariologin/Examen/db.dart';

class ListadoProducto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListadoProducto();
  }
}

class _ListadoProducto extends State<ListadoProducto> {
  List<Map> slist = [];
  MyDb mydb = new MyDb();

  @override
  void initState() {
    mydb.open();
    getdata();
    super.initState();
  }

  getdata() {
    Future.delayed(Duration(milliseconds: 500), () async {
      //use delay min 500 ms, because database takes time to initilize.
      slist = await mydb.db.rawQuery('SELECT * FROM productos');

      setState(() {}); //refresh UI after getting data from table.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado de Productos"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: slist.length == 0
              ? Text("No any students to show.")
              : //show message if there is no any student
              Column(
                  //or populate list to Column children if there is student data.
                  children: slist.map((stuone) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.people),
                        title: Text(stuone["name"]),
                        subtitle: Text("Codigo:" +
                            stuone["codigo"].toString() +
                            ", Add: " +
                            stuone["price"].toString()),
                        trailing: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return EditarProducto(
                                        codigo: stuone["codigo"]);
                                  })); //navigate to edit page, pass student roll no to edit
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () async {
                                  await mydb.db.rawDelete(
                                      "DELETE FROM productos WHERE codigo = ?",
                                      [stuone["codigo"]]);
                                  //delete student data with roll no.
                                  print("Data Deleted");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Student Data Deleted")));
                                  getdata();
                                },
                                icon: Icon(Icons.delete, color: Colors.red))
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
        ),
      ),
    );
  }
}
