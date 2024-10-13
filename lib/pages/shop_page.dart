import 'package:flutter/material.dart';
import 'package:instgram_app/components/my_drawer.dart';
import 'package:instgram_app/components/my_product_tile.dart';


import 'package:instgram_app/model/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final Prodects = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: const Text('Shop Page'),
          actions: [IconButton(onPressed: ()=>Navigator.popAndPushNamed(context, '/Cart_page'), icon: Icon(Icons.shopping_cart_checkout))],
        ),
        drawer: const MyDrawer(),
        body: ListView(children: [
          const SizedBox(height: 25,),
           Center(
              child: Text(
            'pick from a selected list of premium prodect',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          )),
          SizedBox(
            height: 550,
            width: 300,
            child: ListView.builder(
                itemCount: Prodects.length,
                padding: EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final product = Prodects[index];
                  return MyProductTile(product: product);
                }),
          ),
        ]));
  }
}
