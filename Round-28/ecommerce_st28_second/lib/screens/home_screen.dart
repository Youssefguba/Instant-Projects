import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_st28_second/assets_images.dart';
import 'package:ecommerce_st28_second/models/category_model.dart';
import 'package:ecommerce_st28_second/models/product_model.dart';
import 'package:ecommerce_st28_second/repository/category_repo.dart';
import 'package:ecommerce_st28_second/screens/category_screen.dart';
import 'package:ecommerce_st28_second/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const image =
      'https://5.imimg.com/data5/SELLER/Default/2022/3/QX/DC/DV/12982737/whatsapp-image-2022-03-26-at-2-45-17-pm-500x500.jpeg';
  static const image2 =
      'https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F221109130505-yeezy-shoes-adidas-1025.jpg';
  static const image3 =
      'https://www.platypusshoes.co.nz/media/wysiwyg/PLAT_New_Website_Category_Pages_may_20234_1.jpg?auto=webp&quality=85&format=pjpg&width=800';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> listOfImages = [
    'https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F221109130505-yeezy-shoes-adidas-1025.jpg',
    'https://5.imimg.com/data5/SELLER/Default/2022/3/QX/DC/DV/12982737/whatsapp-image-2022-03-26-at-2-45-17-pm-500x500.jpeg',
    'https://dynaimage.cdn.cnn.com/cnn/c_fill,g_auto,w_1200,h_675,ar_16:9/https%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F221109130505-yeezy-shoes-adidas-1025.jpg',
    'https://www.platypusshoes.co.nz/media/wysiwyg/PLAT_New_Website_Category_Pages_may_20234_1.jpg?auto=webp&quality=85&format=pjpg&width=800',
    'https://5.imimg.com/data5/SELLER/Default/2022/3/QX/DC/DV/12982737/whatsapp-image-2022-03-26-at-2-45-17-pm-500x500.jpeg',
    'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ccb15778ba924a508c51af7900e1d508_9366/Avryn_Shoes_White_HP5973_01_standard.jpg',
    'https://i.ebayimg.com/00/s/MTEwMFgxMTAw/z/fX0AAOSw4FpiGRvk/\$_12.JPG?set_id=880000500F',
    'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/ccb15778ba924a508c51af7900e1d508_9366/Avryn_Shoes_White_HP5973_01_standard.jpg',
  ];

  final List<Map<String, dynamic>> listOfProducts = [
    {
      'title': 'Tshirt',
      'price': 100,
      'image': HomeScreen.image,
    },
    {
      'title': 'Tshirt',
      'price': 100,
      'image': HomeScreen.image2,
    },
    {
      'title': 'Tshirt',
      'price': 100,
      'image': HomeScreen.image3,
    },
    {
      'title': 'Tshirt',
      'price': 100,
      'image': HomeScreen.image,
    },
    {
      'title': 'Tshirt',
      'price': 100,
      'image': HomeScreen.image2,
    },
    {
      'title': 'Tshirt',
      'price': 100,
      'image': HomeScreen.image3,
    },
    {
      'title': 'Tshirt',
      'price': 100,
      'image': HomeScreen.image,
    },
  ];

  final List<ProductModel> productList = [
    ProductModel(
      title: 'T-shirt',
      image: HomeScreen.image2,
      price: 10,
    ),
    ProductModel(
      title: 'T-shirt',
      image: HomeScreen.image3,
      price: 1000,
    ),
    ProductModel(
      title: 'T-shirt',
      image: HomeScreen.image,
      price: 1010,
    ),
    ProductModel(
      title: 'T-shirt',
      image: HomeScreen.image2,
      price: 1040,
    ),
    ProductModel(
      title: 'T-shirt',
      image: HomeScreen.image3,
      price: 100,
    ),
  ];



  Future<List<CategoryItemModel>>? categoryData;

  @override
  void initState() {
    super.initState();
    categoryData = CategoryRepo().getCategories();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            const SizedBox(height: 12),

            const SearchBarWidget(),

            // Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 206.5,
                autoPlay: true,
                autoPlayInterval: Duration(
                  milliseconds: 1500,
                ),
                autoPlayCurve: Curves.easeInOut,
              ),
              items: sliderImages.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(i),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        'Hello World!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            // Category
            FutureBuilder(
              future: categoryData,
              builder: (context, snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    width: 200.0,
                    height: 100.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: ListView.separated(
                        itemCount: 5,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10);
                        },
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CircleAvatar(
                            radius: 30,
                          );
                        },
                      ),
                    ),
                  );
                }

                if (snapshot.hasData) {
                  final categoryList = snapshot.data!;
                  return SizedBox(
                    height: 100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: categoryList.length,
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return CategoryProductScreen(
                                          name: categoryList[i].name,
                                          id: categoryList[i].id,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: buildCircleAvatar(
                                  categoryList[i].image,
                                  categoryList[i].name,
                                ),
                              );
                            },
                          ),
                          InkWell(
                            onTap: () {},
                            child: Center(child: Text('See More')),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return const SizedBox();
              },
            ),

            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ProductItemWidget(
                    productItem: productList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
              ),
            ),

            // List View Scrollable with for loop
            // SizedBox(
            //   height: 100,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       // for (var i = 0; i < listOfImages.length; i++)
            //       //   buildCircleAvatar(listOfImages[i]),
            //       // ListView.builder(
            //       //   scrollDirection: Axis.horizontal,
            //       //   itemBuilder: (context, i) {
            //       //     return buildCircleAvatar(listOfFra5[i]);
            //       //   },
            //       // ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildCircleAvatar(String image, String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(image),
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff9098B1),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff9098B1),
                ),
              ),
              hintText: 'Search',
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff9098B1),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.favorite_border_outlined,
            color: Color(0xff9098B1),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.notifications_none_outlined,
            color: Color(0xff9098B1),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
