import 'package:flutter/material.dart';
import 'package:klinik_shoes_project/Routes/routes.dart';
import 'package:klinik_shoes_project/core.dart';
import 'package:klinik_shoes_project/module/homepage/controller/homepage_controller.dart';
import 'package:get/get.dart' as getX;
import 'package:klinik_shoes_project/module/location/view/map_view.dart';

class HomePageView extends StatefulWidget {
  final HomePageController controller;

  HomePageView({required this.controller});

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late PageController _pageController;
  int _currentBannerIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _pageController.addListener(() {
      setState(() {
        _currentBannerIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFEAFBF9), // Warna pertama
              Color(0xFF7FE6DE), // Warna kedua
            ],
            begin: Alignment.topLeft, // Titik awal gradien
            end: Alignment.bottomRight, // Titik akhir gradien
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                children: [
                  _buildTopSection(context), // Bagian atas
                  SizedBox(height: 20),
                  _buildCategoriesSection(), // Bagian kategori
                  SizedBox(height: 20), // Jarak antara kategori dan promosi

                  _buildPromotions(),
                  // Bagian promosi dengan banner
                  SizedBox(height: 60), // Untuk menghindari overflow
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: MenuButton(
          controller: widget.controller), // Menggunakan MenuButton di sini
    );
  }

  // Top section with user profile and location
  Widget _buildTopSection(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // Space between sections
      crossAxisAlignment:
          CrossAxisAlignment.start, // Align at the start of the cross axis
      children: [
        // Left side: Hello and address section
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the left
          children: [
            // Hello text
            Text(
              'Hello,',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontFamily: 'Sora',
                fontWeight: FontWeight.w400,
              ),
            ),
            // Username text
            Text(
              widget.controller
                  .getUserName(), // Use widget.controller for access
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                // Navigate to MapView when the address is clicked
                getX.Get.to(() => MapView());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Align icon and text in the center
                children: [
                  // Custom address icon
                  Container(
                    width: 26.19,
                    height: 26.19,
                    child: Image.asset('asset/marker-pin.png'), // PNG asset
                  ),
                  SizedBox(width: 8), // Space between icon and address
                  Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Align address text to the left
                    children: [
                      Text(
                        'Kos ku',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.75),
                          fontSize: 12,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Jl. Begawan, No 2',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(width: 4), // Space between address and arrow
                          // Downward arrow image
                          Container(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'asset/arrow-bawah.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        // Right side: Notifications and profile picture
        Row(
          children: [
            Stack(
              children: [
                Icon(Icons.notifications, size: 30),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 14), // Space between icon and avatar
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                  'asset/profile-picture.png'), // Profile picture asset
            ),
          ],
        ),
      ],
    );
  }

  // Categories section with GridView
  Widget _buildCategoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // See all action
              },
              child: Text('See all', style: TextStyle(color: Colors.black54)),
            ),
          ],
        ),
        SizedBox(height: 10),
        // Set a specific height for the GridView container
        Container(
          height: 200, // Set height as needed
          child: GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            children: [
              _buildCategoryItem('Simple\nCleaning', 'asset/Image1.png'),
              _buildCategoryItem('Deep\nCleaning', 'asset/Image2.png'),
              _buildCategoryItem('Change\nColor', 'asset/Image3.png'),
              _buildCategoryItem('Leather\nCleaning', 'asset/Image4.png'),
              _buildCategoryItem('Kids\nShoes', 'asset/Image5.png'),
              _buildCategoryItem('Woman\nShoes', 'asset/Image6.png'),
              _buildCategoryItem('Whitening\nTreatment', 'asset/Image7.png'),
              _buildCategoryItem('One Day\nOrder', 'asset/Image8.png'),
            ],
          ),
        ),
        SizedBox(height: 20), // Adjust spacing below GridView if needed
      ],
    );
  }

  // Widget to create individual category item
  Widget _buildCategoryItem(String title, String assetPath) {
    return GestureDetector(
      onTap: () {
        if (title == 'Simple\nCleaning') {
          getX.Get.toNamed(AppRoutes.simple_cleaning);
        } else if (title == 'Deep\nCleaning') {
          getX.Get.toNamed(AppRoutes.deep_cleaning);
        } else if (title == 'Change\nColor') {
          getX.Get.toNamed(AppRoutes.change_color);
        } else if (title == 'Leather\nCleaning') {
          getX.Get.toNamed(AppRoutes.leather_cleaning);
        } else if (title == 'Kids\nShoes') {
          getX.Get.toNamed(AppRoutes.kids_shoes);
        } else if (title == 'Woman\nShoes') {
          getX.Get.toNamed(AppRoutes.woman_shoes);
        } else if (title == 'Whitening\nTreatment') {
          getX.Get.toNamed(AppRoutes.whitening_treatment);
        } else if (title == 'One Day\nOrder') {
          getX.Get.toNamed(AppRoutes.one_day_order);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Image.asset(
              assetPath,
              height: 40,
              width: 40,
            ),
          ),
          SizedBox(height: 10), // Gap between image and text
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.black),
            maxLines: 2, // Limit maximum lines to 2
            overflow: TextOverflow.ellipsis, // Add ellipsis if overflow
          ),
        ],
      ),
    );
  }

  // Promotions slider with indicators
  Widget _buildPromotions() {
    return Column(
      children: [
        Container(
          height: 219,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.controller
                .getBannerCount(), // Ganti ke widget.controller
            itemBuilder: (context, index) {
              return _buildPromotionBanner(widget.controller
                  .getBanner(index)); // Ganti ke widget.controller
            },
          ),
        ),
        SizedBox(height: 10),
        // Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.controller.getBannerCount(), (index) {
            // Ganti ke widget.controller
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              width: _currentBannerIndex == index ? 12.0 : 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color:
                    _currentBannerIndex == index ? Colors.black : Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildPromotionBanner(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Menu Button widget
class MenuButton extends StatelessWidget {
  final HomePageController controller;

  MenuButton({required this.controller});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: (index) => controller.onBottomNavTap(
          context, index), // Calls the method from the controller
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('asset/home.png', width: 24, height: 24),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('asset/cart-icon.png', width: 24, height: 24),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('asset/history-icon.png', width: 24, height: 24),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('asset/user-icon.png', width: 24, height: 24),
          label: 'Profile',
        ),
      ],
    );
  }
}
