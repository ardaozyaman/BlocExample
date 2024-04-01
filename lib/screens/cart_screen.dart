import 'package:flutter/material.dart';
import 'package:robofizz_bloc/blocs/cart_bloc.dart';

import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: StreamBuilder(
        initialData: cartBloc.getCart(),
        stream: cartBloc.getStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildCart(snapshot);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget buildCart(AsyncSnapshot<dynamic> snapshot) {
    var dataList = snapshot.data as List<Cart>;
    return dataList.isEmpty
        ? const LinearProgressIndicator()
        : ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              var data = dataList[index];
              return ListTile(
                title: Text(data.product.name),
                subtitle: Text(data.product.price.toString()),
                trailing: IconButton(
                  onPressed: () {
                    cartBloc.removeFromCart(data);
                  },
                  icon: const Icon(Icons.remove_shopping_cart),
                ),
              );
            },
          );
  }
}
