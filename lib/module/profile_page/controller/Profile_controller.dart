// lib/module/profile_page/controller/edit_profile_controller.dart

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:klinik_shoes_project/model/profile_model.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var profile = UserProfile(
    id: '',
    email: '',
    name: '',
    phone: '',
    address: '',
  ).obs;

  // Fungsi untuk mengambil data profil dari Firestore
  Future<void> loadUserProfile() async {
    final user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        profile.value = UserProfile.fromMap(doc.data()!, doc.id);
      }
    }
  }

  // Fungsi untuk menyimpan data profil ke Firestore
  Future<void> saveProfile(
    String id,
    String email,
    String name,
    String phone,
    String address,
  ) async {
    final userProfile = UserProfile(
      id: id,
      email: email,
      name: name,
      phone: phone,
      address: address,
    );
    await _firestore.collection('users').doc(id).update(userProfile.toMap());
    profile.value = userProfile;
  }
}
