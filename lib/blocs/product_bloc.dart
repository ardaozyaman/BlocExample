import 'dart:async';

import 'package:robofizz_bloc/data/product_service.dart';

import '../models/product.dart';

class ProductBloc{
  final StreamController productStreamController = StreamController.broadcast();

  Stream get getStream =>  productStreamController.stream;

  List<Product> getAll(){
    return ProductService.getAll();
  }
}

final productBloc = ProductBloc();