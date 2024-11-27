import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:klinik_shoes_project/core.dart';
import 'package:klinik_shoes_project/service/notification/NotificationService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:klinik_shoes_project/module/camerapage/view/camerapage_view.dart';

class SimpleCleaningView extends StatefulWidget {
  @override
  _SimpleCleaningViewState createState() => _SimpleCleaningViewState();
}

class _SimpleCleaningViewState extends State<SimpleCleaningView> {
  final NotificationService _notificationService = NotificationService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Define variables for quantity, date, and total price
  String? _selectedPair = '1 pair';
  String? _selectedDate = 'XX/XX/XXXX';
  int _quantity = 1;
  int _pricePerPair = 30000;
  int _deliveryFee = 5000;

  // Compute subtotal and total dynamically
  int get _subtotal => _quantity * _pricePerPair;
  int get _totalPrice => _subtotal + _deliveryFee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAFBF9), // Background warna hijau muda
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
                "Simple Cleaning",
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
                    image: AssetImage('asset/simple_cleaning_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Jasa simple cleaning sepatu yang menyeluruh...",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              SizedBox(height: 20),
              Text("Choose Pair",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                    value: _selectedPair,
                    items: [
                      DropdownMenuItem(value: '1 pair', child: Text('1 pair')),
                      DropdownMenuItem(value: '2 pair', child: Text('2 pair')),
                      DropdownMenuItem(value: '3 pair', child: Text('3 pair')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedPair = value;
                        _quantity = int.parse(value!.split(' ')[0]);
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Pick Date",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                    InkWell(
                      onTap: _pickDate,
                      child: Text(_selectedDate!),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("Tambahkan Foto atau Video Sepatu",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    getX.Get.to(() => CameraPageView());
                  },
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                  label: Text("Buka Kamera"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.local_shipping, color: Colors.black54),
                  SizedBox(width: 10),
                  Text('Delivery fee: Rp. 5,000'),
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
                  Text("Rp. $_subtotal"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery fee", style: TextStyle(color: Colors.black54)),
                  Text("Rp. $_deliveryFee"),
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
                    "Rp. $_totalPrice",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _saveOrderToFirebase,
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

  // Date picker function
  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  // Save order to Firebase
  Future<void> _saveOrderToFirebase() async {
    try {
      await _firestore.collection('orders').add({
        'date': _selectedDate,
        'jumlah': _quantity.toString(),
        'total_harga': _totalPrice.toString(),
      });
      getX.Get.snackbar("Success", "Order saved successfully!");
    } catch (e) {
      getX.Get.snackbar("Error", "Failed to save order.");
    }
  }

  // Back button function
  void _onBackPressed() {
    getX.Get.to(HomePageView(controller: HomePageController()));
    _notificationService.showDelayedNotification();
  }
}
