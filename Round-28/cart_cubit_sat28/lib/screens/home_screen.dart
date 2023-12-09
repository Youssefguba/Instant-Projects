import 'package:cart_cubit_sat28/cubits/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              // if(state is ItemIsAdded) {
              return badges.Badge(
                badgeContent: Text(
                  context.read<CartCubit>().listOfCartItem.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                showBadge: true,
                position: badges.BadgePosition.topEnd(top: -5, end: 4),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                ),
              );
              // }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: context.read<CartCubit>().productList.length,
        itemBuilder: (context, index) {
          final productItem = context.read<CartCubit>().productList[index];
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
              child: const Text('Add'),
              onPressed: () {
                context.read<CartCubit>().addToCart(productItem);
              },
            ),
          );
        },
      ),
    );
  }
}
