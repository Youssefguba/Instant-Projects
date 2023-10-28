import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_sat26/repositories/category_repo.dart';
import 'package:ecommerce_app_sat26/screens/category_screen.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';

class MainScreen extends StatelessWidget {
  List<String> titles = [
    'Hello',
    'World',
    "Ahmed",
    "Mohamed",
    "Omar",
    "Kareem"
  ];

  List<CategoryModel> secondListOfCategory = [
    CategoryModel(title: "Man", image: "assets/images/shirt.png"),
    CategoryModel(title: "Dress", image: "assets/images/dress.png"),
    CategoryModel(
        title: "Man Work Equipment", image: "assets/images/man_bag.png"),
    CategoryModel(title: "Woman Bag", image: "assets/images/woman_bag.png"),
    CategoryModel(title: "Man Shirt", image: "assets/images/shirt.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // top Bar
          _topBar(context),

          // slider
          _buildSliderWidget(),

          // title
          _categorySection(),

          // categories
        ],
      ),
    );
  }

  CarouselSlider _buildSliderWidget() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 220.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
      items: [1, 2, 3, 4, 5].map((index) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Image.asset(
                    'assets/images/images-$index.png',
                    height: 220,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  '${titles[index]}',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }

  Widget _topBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications),
        ),
      ],
    );
  }

  Widget _categorySection() {
    return FutureBuilder(
      future: CategoryRepo().getCategories(),
      builder: (context, snapshot) {
        final response = snapshot.data;

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.connectionState == ConnectionState.none) {
          return Text(
            'There is no Internet!',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 19,
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          // data is exist or null
          if (snapshot.data == null) {
            return Text(
              'There is no data!',
              style: TextStyle(
                color: Colors.red,
                fontSize: 19,
              ),
            );
          }

          // success case - best scenario
          if (response != null) {
            if (response.statusCode == 404) {
              return Text('404');
            }

            // {
            //     "status": true,
            //     "message": null,
            //     "data": {
            //         "current_page": 1,
            //         "data": [
            //             {
            //                 "id": 44,
            //                 "name": "اجهزه الكترونيه",
            //                 "image": "https://student.valuxapps.com/storage/uploads/categories/16301438353uCFh.29118.jpg"
            //             },


            
            final listOfCategories = response.data['data']['data'];

            return Container(
              height: 100,
              child: ListView.builder(
                itemCount: listOfCategories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>

                            CategoryScreen(
                          title: listOfCategories[index]['name'],
                          imageURL: listOfCategories[index]['image'],
                            id: listOfCategories[index]['id']
                        ),
                      ));

                      print('This is a category : ${listOfCategories[index]['name']}');
                    },
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 31,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                listOfCategories[index]['image'],
                              ),
                              radius: 30,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            listOfCategories[index]['name'].toString(),
                            style: TextStyle(
                              color: Color(0xff9098B1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }

        return Text('Failed!');
      },
    );
  }
}
