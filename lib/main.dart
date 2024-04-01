import 'package:flutter/material.dart';
import 'package:robofizz_bloc/screens/cart_screen.dart';
import 'package:robofizz_bloc/screens/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
       "/products" : (context) => const ProductListScreen(),
       "/cart" : (context) => const CartScreen(),
      },
      initialRoute: "/products",
    );
  }
}