import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:klinik_shoes_project/core.dart';
import 'package:klinik_shoes_project/service/notification/NotificationService.dart';

class ChangeColorView extends StatelessWidget {
  final NotificationService _notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAFBF9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            _onBackPressed();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Change Color",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage('asset/change_color.png'), // Gambar
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Dengan teknik pewarnaan khusus yang aman bagi material sepatu, kami memberikan hasil warna yang konsisten dan tahan lama sesuai keinginan Anda.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Choose Pair",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: '1 pair',
                    items: [
                      DropdownMenuItem(value: '1 pair', child: Text('1 pair')),
                      DropdownMenuItem(value: '2 pair', child: Text('2 pair')),
                      DropdownMenuItem(value: '3 pair', child: Text('3 pair')),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Pick Date",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16, color: Colors.black54),
                    SizedBox(width: 8),
                    Text('XX/XX/XXXX'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.local_shipping, color: Colors.black54),
                  SizedBox(width: 10),
                  Text('Delivery fee: 5k'),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text('See Review',
                        style: TextStyle(color: Colors.black54)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtotal", style: TextStyle(color: Colors.black54)),
                  Text("Rp.30.000"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery fee", style: TextStyle(color: Colors.black54)),
                  Text("Rp.5.000"),
                ],
              ),
              Divider(height: 30, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "Rp.35.000",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.attach_money, color: Colors.white),
                  label: Text("Checkout"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onBackPressed() {
    // Kembali ke halaman sebelumnya
    getX.Get.to(HomePageView(controller: HomePageController()));

    // Panggil fungsi untuk menampilkan notifikasi
    _notificationService.showDelayedNotification();
  }
}
