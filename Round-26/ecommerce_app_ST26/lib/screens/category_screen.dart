import 'package:dio/dio.dart';
import 'package:ecommerce_app_sat26/repositories/category_repo.dart';
import 'package:ecommerce_app_sat26/screens/single_product_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/product_category_model.dart';

class CategoryScreen extends StatelessWidget {
  final String title;
  final String imageURL;
  final int id;

  const CategoryScreen({
    super.key,
    required this.title,
    required this.imageURL,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder(
          future: CategoryRepo().getCategoryDetails(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return Text('Error');
              }

              if (snapshot.data != null) {
                final listOfProducts = snapshot.data!.data['data']
                    ['data']; // FutureBuilder Snapshot data
                print('list of products : $listOfProducts');

                // TODO: Change color of ClampingScrollPhysics
                return GridView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: listOfProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                    mainAxisExtent: 230,
                  ),
                  itemBuilder: (_, index) {
                    final categoryItem =
                        CategoryProduct.fromJson(listOfProducts[index]);

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SingleProductScreen(
                                categoryItem: categoryItem
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 170,
                        width: 120,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Image
                            Image.network(
                              categoryItem.image,
                              height: 90,
                              width: 90,
                            ),

                            // Text
                            Text(
                              categoryItem.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),

                            // Rating
                            RatingBar.builder(
                              itemSize: 20,
                              initialRating: 3,
                              minRating: 1,
                              ignoreGestures: true,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),

                            // Text
                            Text(categoryItem.price.toString()),

                            // Row [ Text, Text, Icon ]

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(categoryItem.oldPrice.toString()),
                                Text(categoryItem.discount.toString()),
                                Icon(Icons.delete_outline),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }

            return Center(
              child: Text('Category Screen'),
            );
          }),
    );
  }
}
