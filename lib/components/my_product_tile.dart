import 'package:flutter/material.dart';

import 'package:instgram_app/model/product.dart';
import 'package:instgram_app/model/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatefulWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  @override
  State<MyProductTile> createState() => _MyProductTileState();
}

class _MyProductTileState extends State<MyProductTile> {
  void addToCart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Add this item to your cart?'),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: (){
                     Navigator.pop(context);
                     context.read<Shop>().addToCart(widget.product);
                  } ,
                
                  child: const Text('yes'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primary,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    padding: const EdgeInsets.all(25),
                    child:Image.asset(widget.product.imagepath)),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                widget.product.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$' + widget.product.price.toStringAsFixed(2)),
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () => addToCart(context),
                      icon: const Icon(Icons.add)))
            ],
          ),
        ],
      ),
    );
  }
}
