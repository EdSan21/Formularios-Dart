import 'package:flutter/material.dart';
import 'package:formulariologin/models/models.dart';
import 'package:formulariologin/providers/product_form_provider.dart';
import 'package:formulariologin/widgets/auth_background.dart';
import 'package:formulariologin/widgets/card_container.dart';
import 'package:formulariologin/widgets/test_cards.dart';
// import 'package:formulariologin/screen/screens.dart';
import 'package:formulariologin/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: TestoCard());
  }
}
