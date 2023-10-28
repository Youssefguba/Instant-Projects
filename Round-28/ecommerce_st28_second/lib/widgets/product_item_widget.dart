import 'package:ecommerce_st28_second/models/product_model.dart';
import 'package:ecommerce_st28_second/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel productItem;

  const ProductItemWidget({super.key, required this.productItem});

  // Dummy Data
  @override
  Widget build(BuildContext context) {
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
                  productItem.image,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Title
          Text(
            productItem.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: AppColors.textColor,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            productItem.price.toString(),
            maxLines: 1,
            style: TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
