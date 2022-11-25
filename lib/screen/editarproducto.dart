import 'package:flutter/material.dart';
import 'package:formulariologin/models/models.dart';
import 'package:formulariologin/providers/product_form_provider.dart';
import 'package:formulariologin/widgets/auth_background.dart';
import 'package:formulariologin/widgets/card_container.dart';
import 'package:formulariologin/widgets/product_card.dart';
// import 'package:formulariologin/screen/screens.dart';
import 'package:formulariologin/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class FormEditarProduct extends StatelessWidget {
  const FormEditarProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Formulario'), backgroundColor: Colors.blueGrey),
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        SizedBox(height: 30),
        CardContainer(
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                'Sistema de Edición - Producto',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 30),
              ChangeNotifierProvider(
                  create: (_) => ProductFormProvider(
                      Productos(available: false, name: "", price: 0)),
                  child: FormularioProd())
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "home");
        },
        label: const Text('Editar'),
        icon: const Icon(Icons.edit_note),
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class FormularioProd extends StatelessWidget {
  const FormularioProd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Container(
      child: Form(
        key: productForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.text,
              onChanged: (value) => productForm.product.name = value,
              decoration: InputDecorationsEdicionProd.authInputDecoration(
                  hintText: "Azúcar Suli",
                  prefixIcon: Icons.shopping_bag_outlined,
                  labelText: "Nombre de Producto"),
              validator: (value) {
                return (value != null && value.length >= 1)
                    ? null
                    : 'Campo Obligatorio';
              },
            ),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.number,
              //initialValue: "0",
              onChanged: (value) =>
                  {productForm.product.price = double.parse(value)},
              decoration: InputDecorationsEdicionProd.authInputDecoration(
                  hintText: "0.00",
                  prefixIcon: Icons.price_change_outlined,
                  labelText: "Precio"),
              validator: (value) {
                String pattern = r'^\d+(,\d{1,2})?$';
                RegExp regex = new RegExp(pattern);
                return regex.hasMatch(value ?? '')
                    ? null
                    : 'El valor no es correcto';
              },
            ),
            TextFormField(
              autocorrect: false,
              onChanged: (value) =>
                  productForm.product.available = (value == true),
              keyboardType: TextInputType.text,
              decoration: InputDecorationsEdicionProd.authInputDecoration(
                  hintText: "Si/No",
                  prefixIcon: Icons.check_box_outlined,
                  labelText: "Disponible"),
              validator: (value) {
                return (value != null) ? null : 'El campo es obligatorio';
              },
            ),
            TextFormField(
              autocorrect: false,
              onChanged: (value) => productForm.product.picture = value,
              keyboardType: TextInputType.text,
              decoration: InputDecorationsEdicionProd.authInputDecoration(
                  hintText: "jpeg, jpg, png",
                  prefixIcon: Icons.image,
                  labelText: "Imagen"),
            ),
            SizedBox(height: 30),
            // MaterialButton(
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10)),
            //   disabledColor: Colors.grey,
            //   elevation: 0,
            //   color: Color.fromARGB(255, 26, 85, 87),
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            //     child: Text(
            //       "Editar",
            //       style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            //     ),
            //   ),
            //   onPressed: () {
            //     Navigator.pushReplacementNamed(context, "productos");
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
