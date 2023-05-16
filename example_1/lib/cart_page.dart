import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CART'),
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Consumer<CartModel>(
        // 여기에 집중
        builder: (context, cart, child) {
          print(cart.items.toString());
          return Text('Total price: ${cart.items}');
        },
      ),
    );
  }
}
