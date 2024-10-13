import 'package:flutter/material.dart';
import 'package:instgram_app/components/my_botton.dart';
import 'package:instgram_app/model/product.dart';
import 'package:instgram_app/model/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Remove this item from your cart?'),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: const Text('yes'),
                ),
              ],
            ));
  }

  void payButtonPressed(BuildContext) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text('Use wants to pay! Connect this app to your payment back'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
              child:cart.isEmpty?const Center(child: Text('you cart is empty...')) :ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        onPressed: () => removeItemFromCart(context,item),
                        icon: const Icon(Icons.remove),
                      ),
                    );
                  })
                  ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyBotton(
                onTap: () => payButtonPressed(context), child: const Text('Pay Now')),
          )
        ],
      ),
    );
  }
}
