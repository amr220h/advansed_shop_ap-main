
import 'package:flutter/material.dart';
import 'package:instgram_app/components/my_botton.dart';
import 'package:instgram_app/pages/shop_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Center(
            child: Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //*title
          const Text(
            'Minimal shop',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(
            height: 10,
          ),

          //*subtitel
          Text(
            'premium Quality Products',
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          const SizedBox(
            height: 25,
          ),
          //*button
          MyBotton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ShopPage()));
              },
              child: const Icon(Icons.arrow_forward))
        ],
      ),
    );
  }
}
