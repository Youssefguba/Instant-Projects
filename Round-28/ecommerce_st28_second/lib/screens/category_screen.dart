import 'package:ecommerce_st28_second/repository/product_repo.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CategoryProductScreen extends StatelessWidget {
  final String name;
  final int id;
  const CategoryProductScreen({
    super.key,
    required this.name,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: FutureBuilder(
          future: ProductRepo().getProductsByCategoryId(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData) {
              final listOfProducts = snapshot.data;
              return GridView.builder(
                itemCount: listOfProducts.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xffEBF0FF)),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Image
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                              image: NetworkImage(
                                listOfProducts[index]['image'],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Title
                        Text(
                          listOfProducts[index]['name'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: AppColors.textColor,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          'productItem.price.toString()',
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                    childAspectRatio: 0.8,
                ),
              );
            }

            return SizedBox();
          }),
    );
  }
}
