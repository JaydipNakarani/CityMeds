import 'package:carousel_slider/carousel_slider.dart';
import 'package:citymeds/constants/image_constants.dart';
import 'package:citymeds/data/dummy_data.dart';
import 'package:citymeds/models/product_model.dart';
import 'package:citymeds/models/store_model.dart';
import 'package:citymeds/screens/home/widgets/category_card.dart';
import 'package:citymeds/screens/home/widgets/home_header.dart';
import 'package:citymeds/screens/home/widgets/home_search_bar.dart';
import 'package:citymeds/screens/home/widgets/home_tabs.dart';
import 'package:citymeds/screens/home/widgets/memebership_container.dart';
import 'package:citymeds/screens/home/widgets/product_card.dart';
import 'package:citymeds/screens/home/widgets/refer_earn_container.dart';
import 'package:citymeds/screens/home/widgets/section_header.dart';
import 'package:citymeds/screens/home/widgets/store_card.dart';
import 'package:citymeds/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentCarouselIndex = 0;
  // Sample store data
  final List<StoreModel> stores = [
    StoreModel(
      logoUrl: Images.pharmacy,
      name: "Sharma Medical Store",
      location: "Daulatpura, Ghaziabad",
      isAvailable: true,
      experience: "11 Years Exp",
      medicinesCount: "500+ Medicine",
    ),
    StoreModel(
      logoUrl: Images.pharmacy,
      name: "Goel Medical Store",
      location: "Mohanagar, Ghaziabad",
      isAvailable: false,
      experience: "11 Years Exp",
      medicinesCount: "500+ Medicine",
    ),
    StoreModel(
      logoUrl: Images.pharmacy,
      name: "Sharma Medical Store",
      location: "Daulatpura, Ghaziabad",
      isAvailable: true,
      experience: "11 Years Exp",
      medicinesCount: "500+ Medicine",
    ),
  ];

  final List<ProductModel> flashProducts = [
    ProductModel(
      imageUrl: Images.ensurePow,
      name: "Ensure Powder for Adults",
      mrp: "280",
      price: "240",
    ),
    ProductModel(
      imageUrl: Images.ensure,
      name: "Philips Natural Bottle",
      mrp: "280",
      price: "240",
    ),
    ProductModel(
      imageUrl: Images.ensure,
      name: "Philips Natural Bottle",
      mrp: "280",
      price: "240",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            automaticallyImplyLeading: false,
            expandedHeight: 143.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const HomeHeaderContent(),
                  Positioned(
                    bottom: 0,
                    left: 19,
                    right: 19,
                    child: HomeSearchBar(),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.secondary,
            ),
            elevation: 0,
          ),
          // Scrollable content
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              _buildCategoriesList(),
              const SizedBox(height: 16),
              HomeTabs(tabs: DummyData.tabs),
              const SizedBox(height: 10),
              _buildCarousel(),
              _buildPopularStoreSection(),
              const ReferAndEarnContainer(),
              _buildFlashCardsSection(),
              const MembershipCard(),
              const SizedBox(height: 120),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesList() {
    return SizedBox(
      height: 127,
      child: Center(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true, // <-- Add this
          itemCount: DummyData.categories.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            final category = DummyData.categories[index];
            return CategoryCard(category: category);
          },
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    final List<String> bannerImages = [
      Images.carousel,
      Images.carousel,
      Images.carousel,
    ];

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 225.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentCarouselIndex = index;
              });
            },
          ),
          items: bannerImages.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          // color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(
                              imageUrl,
                            ), // Use NetworkImage for URLs
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -30,
                      // left: 30,
                      // width: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width * .88,
                      child: Center(
                        child: Image.asset(
                          Images.bottle,
                          height: 300,
                          width: 300,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10), // Space between carousel and indicator
        // Smooth page indicator
        AnimatedSmoothIndicator(
          activeIndex: _currentCarouselIndex,
          count: bannerImages.length,
          effect: JumpingDotEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor:
                AppColors.secondary, // Customize the active dot color
            dotColor: Color(0xffD9D9D9), // Customize the inactive dot color
          ),
        ),
      ],
    );
  }

  Widget _buildPopularStoreSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SectionHeader(
            title: "Popular Store",
            seeAllText: "See all",
            onSeeAllPressed: () {},
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: stores.length,
          itemBuilder: (context, index) {
            return StoreCard(store: stores[index]);
          },
        ),
      ],
    );
  }

  Widget _buildFlashCardsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SectionHeader(
            title: "Flash Cards",
            seeAllText: "See all",
            onSeeAllPressed: () {
              // Navigate to see all products
            },
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 220, // Adjust height as needed
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: flashProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(product: flashProducts[index]);
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
