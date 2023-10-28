import 'package:ecommerce_app_sat26/cubits/single_product_cubit/single_product_cubit.dart';
import 'package:ecommerce_app_sat26/models/product_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleProductScreen extends StatelessWidget {
  final CategoryProduct categoryItem;
  const SingleProductScreen({
    super.key,
    required this.categoryItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryItem.name),
      ),
      body: Column(
        children: [
          Image.network(categoryItem.image, height: 100),
          ElevatedButton(
            onPressed: () {
              context.read<SingleProductCubit>().addItemToProduct(
                    categoryItem.id,
                  );
            },
            child: Text(
              'Add To Cart',
            ),
          ),
        ],
      ),
    );
  }
}
