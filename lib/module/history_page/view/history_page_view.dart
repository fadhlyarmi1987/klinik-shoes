import 'package:flutter/material.dart';
import 'package:klinik_shoes_project/module/cart_page/view/cart_page_view.dart';
import 'package:klinik_shoes_project/module/homepage/view/homepage_view.dart';
import 'package:klinik_shoes_project/module/homepage/controller/homepage_controller.dart';
import 'package:klinik_shoes_project/module/profile_page/view/profile_page.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int _selectedIndex = 2; // Initially set to History page

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
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CartPage())); // Navigate to CartPage
        break;
      case 2:
        // History is the current page, do nothing
        break;
      case 3:
        // Uncomment and replace with your ProfilePage when implemented
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfilePage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // action for cart button
            },
          )
        ],
        backgroundColor: Color(0xFFEAFBF9),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFEAFBF9), // Warna awal
              Color(0xFF7FE6DE), // Warna akhir
            ],
            begin: Alignment.topCenter, // Mulai dari atas
            end: Alignment.bottomCenter, // Berakhir di bawah
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'asset/whitening_logo.png', // Menggunakan Asset Image
                      width: 105,
                      height: 105,
                      fit: BoxFit.cover, // Pastikan gambar tidak overflow
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Whitening Treatment',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // action for see detail
                                },
                                child: Text(
                                  'See detail',
                                  style: TextStyle(fontSize: 8),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Pairs:',
                                      style: TextStyle(fontSize: 12)),
                                  SizedBox(height: 4),
                                  Text('Total Price:',
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('1',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                  SizedBox(height: 4),
                                  Text('Rp. 55.000',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Status: DONE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 12,
                            ),
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
