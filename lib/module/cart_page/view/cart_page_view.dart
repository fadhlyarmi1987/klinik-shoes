import 'package:flutter/material.dart';
import 'package:klinik_shoes_project/module/history_page/view/history_page_view.dart';
import 'package:klinik_shoes_project/module/payment_page/view/payment_page_view.dart';
import 'package:klinik_shoes_project/module/homepage/view/homepage_view.dart';
import 'package:klinik_shoes_project/module/homepage/controller/homepage_controller.dart';
// import 'package:klinik_shoes_project/module/history_page/view/history_page_view.dart'; // Import your HistoryPage
// import 'package:klinik_shoes_project/module/profile_page/view/profile_page_view.dart'; // Import your ProfilePage

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _selectedIndex = 1; // Initially set to Cart page

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomePageView(controller: HomePageController())));
        break;
      case 1:
        // Cart is the current page, do nothing
        break;
      case 2:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HistoryPage())); // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HistoryPageView())); // Replace with your HistoryPage
        break;
      case 3:
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePageView())); // Replace with your ProfilePage
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEAFBF9),
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: Text(
          'Your Order',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFEAFBF9), // Start color
              Color(
                  0xFF7FE6DE), // End color (change this to your preferred color)
            ],
            begin: Alignment.topCenter, // Gradient starts from the top
            end: Alignment.bottomCenter, // Gradient ends at the bottom
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery Address Section
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.black),
                SizedBox(width: 8.0),
                Text(
                  'Delivery Address',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Address :\nJl. Begawan, No 2, Tlogomas,\nKec. Lowokwaru, Kota Malang, Jawa Timur',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                  Icon(Icons.add_circle_outline, color: Colors.black),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutPage()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'asset/one_day_order.png', // Update with your image
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'One Day Order',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                              'Pairs : 1\nDelivery fee : Rp.5.000\nPrice : Rp.50.000'),
                          SizedBox(height: 8.0),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Price :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Rp.55.000',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Set current index
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // Use the method to handle taps
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
