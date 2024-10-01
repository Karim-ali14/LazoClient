import 'package:flutter/cupertino.dart';
import 'package:lazo_client/Presentation/Screens/cartScreen/componants/CartItemView.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return const CartItemView();
    });
  }
}
