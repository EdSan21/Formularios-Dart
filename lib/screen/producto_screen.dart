import 'package:flutter/material.dart';
import 'package:formulariologin/providers/product_form_provider.dart';
import 'package:formulariologin/widgets/auth_background.dart';
import 'package:formulariologin/widgets/card_container.dart';
import 'package:formulariologin/widgets/listado_prods.dart';
// import 'package:formulariologin/screen/screens.dart';
import 'package:formulariologin/ui/input_decorations.dart';
import 'package:provider/provider.dart';

import '../providers/getproducts_provider.dart';

class ProductoScreen extends StatelessWidget {
  const ProductoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final productoForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      body: AuthBackgroundProd(
        child: SingleChildScrollView(
            child: ChangeNotifierProvider(
                create: (__) => new GetProductosProvider(),
                child: CardsProductos())),
      ),
    );
  }
}


// class _ProductoForm extends StatelessWidget {
//   const _ProductoForm({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final productoForm = Provider.of<ProductFormProvider>(context);
//     return Container(
//       child: Form(
//         key: productoForm.formKey,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         child: Column(children: [
//           TextFormField(
//             autocorrect: false,
//             keyboardType: TextInputType.text,
//             decoration: InputDecorations.authInputDecoration(
//                 hintText: "Azúcar Suli",
//                 labelText: "Producto",
//                 prefixIcon: Icons.shopping_bag_outlined),
//             onChanged: (value) => productoForm.product.name = value,
//             validator: (value) {
//               return (value != null) ? null : 'Campo obligatorio';
//             },
//           ),
//           SizedBox(height: 30), //espacio en blanco

//           TextFormField(
//               obscureText: true,
//               autocorrect: false,
//               keyboardType: TextInputType.text,
//               decoration: InputDecorations.authInputDecoration(
//                   hintText: "5.50",
//                   labelText: "Precio",
//                   prefixIcon: Icons.price_change_outlined),
//               onChanged: (value) =>
//                   productoForm.product.price = value as double,
//               validator: (value) {
//                 return (value != null) ? null : 'Campo obligatorio';
//               }),
//           SizedBox(height: 30), //espacio en blanco

//           TextFormField(
//               autocorrect: false,
//               keyboardType: TextInputType.text,
//               decoration: InputDecorations.authInputDecoration(
//                   hintText: "1",
//                   labelText: "Disponible",
//                   prefixIcon: Icons.check_box_outlined),
//               onChanged: (value) =>
//                   productoForm.product.available = value as bool,
//               validator: (value) {
//                 return (value != null) ? null : 'Campo obligatorio';
//               }),
//           SizedBox(height: 30), //espacio en blanco

//           FlatButton(
//             onPressed: () {
//               Navigator.pushReplacementNamed(context, "home");
//             },
//             color: Color.fromARGB(255, 185, 26, 145),
//             child: Text(
//               'Insertar',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),

          // MaterialButton(
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //   disabledColor: Colors.grey,
          //   elevation: 0,
          //   color: Colors.deepPurple,
          //   child: Container(
          //     padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          //     child: Text(
          //       productoForm.UpdateAvailability(false) ? 'Espere' : 'Insertar',
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          //   onPressed: productoForm.UpdateAvailability(true)
          //       ? null
          //       : () async {
          //           FocusScope.of(context).unfocus();
          //           if (productoForm.isValidForm() != null) return;
          //           productoForm.UpdateAvailability(true);
          //           await Future.delayed(Duration(seconds: 2));

          //           productoForm.UpdateAvailability(false);
          //           Navigator.pushReplacementNamed(context, "home");
          //         },
          // )
//         ]),
//       ),
//     );
//   }
// }
