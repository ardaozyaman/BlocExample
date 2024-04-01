import 'package:flutter/material.dart';
import 'package:robofizz_bloc/blocs/cart_bloc.dart';
import 'package:robofizz_bloc/blocs/product_bloc.dart';

import '../models/cart.dart';
import '../models/product.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart");
              },
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: productsBuild(),
    );
  }

  productsBuild() {
    return StreamBuilder(
      initialData: productBloc.getAll(),
      stream: productBloc.getStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data as List;
          return data.isEmpty
              ? const CircularProgressIndicator(
                  color: Colors.redAccent,
                )
              : productItems(snapshot);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  productItems(AsyncSnapshot snapshot) {
    var dataList = snapshot.data as List<Product>;
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        var data = dataList[index];
        return Card(
          child: ListTile(
            title: Text(data.name),
            subtitle: Text(data.price.toString()),
            trailing: IconButton(
              onPressed: () {
                cartBloc.addToCart(Cart(product: data, quantity: 1));
              },
              icon: const Icon(Icons.add_shopping_cart),
            ),
          ),
        );
      },
    );
  }
}
