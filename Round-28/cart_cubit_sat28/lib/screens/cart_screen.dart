import 'package:cart_cubit_sat28/cubits/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: context.watch<CartCubit>().listOfCartItem.length,
        itemBuilder: (context, index) {
          final productItem = context.watch<CartCubit>().listOfCartItem[index];
          return ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: productItem.color,
              ),
              height: 40,
              width: 40,
            ),
            title: Text(productItem.name),
            subtitle: Text('\$${productItem.price}'),
            trailing: TextButton(
              child: Icon(Icons.delete),
              onPressed: () {
                context.read<CartCubit>().removeFromCart(productItem);
              },
            ),
          );
        },
      )
    );
  }
}
