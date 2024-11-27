import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:klinik_shoes_project/core.dart';
import 'package:klinik_shoes_project/module/cart_page/view/cart_page_view.dart';
import 'package:klinik_shoes_project/module/history_page/view/history_page_view.dart';
import 'package:klinik_shoes_project/module/profile_page/view/edit_profile_view.dart';
import 'package:klinik_shoes_project/module/profile_page/view/setting_view.dart';
import 'package:klinik_shoes_project/module/webview/view/WebView_view.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3; // Default index for Profile

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the respective pages based on index
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePageView(
                  controller: HomePageController())), // Navigate to Home
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => CartPage()), // Navigate to Cart
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HistoryPage()), // Navigate to History
        );
        break;
      case 3:
        // You are already on Profile page, so no need to navigate
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF29D6C8),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePageView(
                      controller: HomePageController())), // Navigate to Home
            );
          },
        ),
        title: Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => CartPage()), // Navigate to Cart
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFF29D6C8),
            padding:
                EdgeInsets.only(top: 50, bottom: 60, right: 121.8, left: 121.5),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('asset/profile-picture.png'),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Dimas Arief W.',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Dummy@example.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        leading: Icon(Icons.person_outline, color: Colors.teal),
                        title: Text('Edit User Profile'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          getX.Get.to(() =>
                              EditProfilePage()); // Navigasi ke halaman EditProfilePage
                        },
                      ),
                      Divider(height: 1, thickness: 1),
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        leading:
                            Icon(Icons.settings_outlined, color: Colors.teal),
                        title: Text('Settings'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          getX.Get.to(() =>
                              SettingsPage()); // Navigasi ke halaman SettingsPage
                        },
                      ),
                      Divider(height: 1, thickness: 1),
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        leading: Icon(Icons.phone_outlined, color: Colors.teal),
                        title: Text('Call Center'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigate to WebView page for Instagram
                          getX.Get.to(WebViewPage(
                              url:
                                  'https://www.instagram.com/klinik__shoes?igsh=M3RvZjFmYmwxbmkz')); // Using GetX for navigation
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
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
      ),
    );
  }
}
