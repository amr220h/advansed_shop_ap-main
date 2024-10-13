import 'package:flutter/material.dart';
import 'package:instgram_app/model/shop.dart';
import 'package:instgram_app/pages/Intro_page.dart';
import 'package:instgram_app/pages/cart_page.dart';
import 'package:instgram_app/pages/shop_page.dart';
import 'package:instgram_app/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shap_page': (context) => const ShopPage(),
        '/Cart_page': (context) => const CartPage(),
      },
    );
  }
}
