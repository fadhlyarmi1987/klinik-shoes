import 'package:flutter/material.dart';
import 'package:klinik_shoes_project/model/category/category_model.dart';

class HomePageController {
  // Sample data for categories
  final List<Category> categories = [
    Category(name: 'Simple Cleaning', iconPath: 'assets/simple_cleaning.png'),
    Category(name: 'Deep Cleaning', iconPath: 'assets/deep_cleaning.png'),
    Category(name: 'Change Color', iconPath: 'assets/change_color.png'),
    Category(name: 'Leather Cleaning', iconPath: 'assets/leather_cleaning.png'),
    Category(name: 'Kids Shoes', iconPath: 'assets/kids_shoes.png'),
    Category(name: 'Woman Shoes', iconPath: 'assets/woman_shoes.png'),
    Category(name: 'Whitening', iconPath: 'assets/whitening_treatment.png'),
    Category(name: 'One Day Order', iconPath: 'assets/one_day_order.png'),
  ];

  // Sample data for banners
  final List<String> banners = [
    'asset/Banner_1.png',
    'asset/Banner_2.png',
    // Add more banners as needed
  ];

  String getUserName() {
    return 'Dimas Arief W.'; // Return the username
  }

  void onCategorySelected(String categoryName) {
    // Handle category selection logic here
    print('Category selected: $categoryName');
  }

  int getBannerCount() {
    return banners.length; // Get the number of banners
  }

  String getBanner(int index) {
    return banners[index]; // Get the banner image path by index
  }

  void onBottomNavTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Navigate to Home Page
        Navigator.pushNamed(
            context, '/home'); // Adjust the route name if necessary
        break;
      case 1:
        // Navigate to Cart Page
        Navigator.pushNamed(
            context, '/cart'); // Adjust the route name if necessary
        break;
      case 2:
        // Navigate to History Page
        Navigator.pushNamed(
            context, '/history1'); // Adjust the route name if necessary
        break;
      case 3:
        // Navigate to Profile Page
        Navigator.pushNamed(
            context, '/profile'); // Adjust the route name if necessary
        break;
      default:
        break;
    }
  }
}
