import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // final List<String> categories = [
  //   'Shirts',
  //   'Pants',
  //   'Clothes',
  //   'Dressed',
  //   'Hats',
  // ];
  //
  // List<String> listOfImages = [
  //   'assets/images/man_bag.png',
  //   'assets/images/shirt.png',
  //   'assets/images/woman_bag.png',
  //   'assets/images/dress.png',
  // ];

  // final listOfCategories = [
  //   {
  //     'image': 'assets/images/man_bag.png',
  //     'name' : 'Man Bag',
  //     'discount' : true,
  //      'discountPrice': 100.0

  //   },
  //   {
  //     'image': 'assets/images/shirt.png',
  //     'name' : 'shirt',
  //   },
  //   {
  //     'image': 'assets/images/woman_bag.png',
  //     'name' : 'Woman Bag',
  //   },
  //   {
  //     'image': 'assets/images/dress.png',
  //     'name' : 'Dress',
  //   },
  // ];

  final List<CategoryItem> listOfCategoryTwo = [
    CategoryItem(
      'assets/images/man_bag.png',
      'Man',
      Colors.black,
      25,
      1,
    ),
    CategoryItem(
      'assets/images/woman_bag.png',
      'Woman',
      Colors.orange,
      18,
      2,
    ),
    CategoryItem(
      'assets/images/dress.png',
      'Dress',
      Colors.green,
      11,
      3,

    ),
    CategoryItem(
      'assets/images/shirt.png',
      'Shirt',
      Colors.purple,
      15,
      4,
    ),

  ];

  final Map<int, Color> listOfStyle =
    {
      1: Colors.black,
      2: Colors.orange,
      3: Colors.greenAccent,
      4: Colors.red,
    };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 1500),
                  autoPlayCurve: Curves.bounceInOut,
                  viewportFraction: 0.9,
                  enlargeFactor: 1,
                  onPageChanged: (index, reason) {
                    print('My index is $index');
                  }),
              items: <String>[
                'https://assets.adidas.com/images/w_600,f_auto,q_auto/f6bfb2c064a64c498e57af1700593332_9366/Stan_Smith_Lux_Shoes_White_HQ6785_HM1.jpg',
                'https://assets.adidas.com/images/w_600,f_auto,q_auto/8619686322bb40e08f6baf5b010565e3_9366/Superstar_x_Indigo_Herz_Shoes_Black_IE1842_HM1.jpg',
                'https://img2.exportersindia.com/product_images/bc-full/2021/10/9461945/adidas-x_plr-1634235152-6038460.png',
                'https://assets.adidas.com/images/w_600,f_auto,q_auto/4e0564c27f754915b743afa200c7db08_9366/Samba_Originals_Shoes_White_ID2047_01_standard.jpg',
              ].map((name) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Image.network(
                        name,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: listOfCategoryTwo.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {

                  return Column(
                    children: [
                      categoryItem(listOfCategoryTwo[index].image),
                      Text(
                        listOfCategoryTwo[index].categoryName,
                        style: TextStyle(
                          color: listOfStyle[listOfCategoryTwo[index].code],
                          fontSize: listOfCategoryTwo[index].fontSize,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Category
            // Container(
            //   margin: const EdgeInsets.all(8.0),
            //   height: 100,
            //   child: ListView.builder(
            //     itemCount: categories.length,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) {
            //       return Column(
            //         children: [
            //           categoryItem(),
            //           Text('${categories[index]}'),
            //         ],
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget categoryItem(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 31,
            backgroundColor: Colors.orange,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset(image),
            ),
          ),
        ],
      ),
    );
  }
}

// Model
class CategoryItem {
  final String image;
  final String categoryName;

  final Color color;

  final double fontSize;

  final int code;
  CategoryItem(this.image, this.categoryName, this.color, this.fontSize, this.code);
}
