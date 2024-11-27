import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfileController extends GetxController {
  var profile = {
    'photoUrl': RxString(''),
    'email': RxString(''),
    'name': RxString(''),
    'phone': RxString(''),
    'address': RxString(''),
  };

  final ImagePicker _picker = ImagePicker();

  // Fungsi untuk memilih dan mengunggah gambar
  Future<void> selectAndUploadProfileImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);

      try {
        // Nama file unik menggunakan waktu saat ini
        String fileName =
            'profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg';
        firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref().child(fileName);

        // Mengunggah gambar ke Firebase Storage
        await ref.putFile(file);

        // Mendapatkan URL gambar yang diunggah
        String downloadURL = await ref.getDownloadURL();

        // Memperbarui URL gambar di profil
        profile['photoUrl']?.value = downloadURL; // Safe access using ?.value

        // Simpan URL foto di database pengguna
        await updateUserProfilePhoto(downloadURL);
      } catch (e) {
        print("Error uploading image: $e");
      }
    }
  }

  // Fungsi untuk memuat profil dari database (termasuk foto URL)
  void loadProfile() async {
    // Misalnya, mendapatkan URL dari database Firestore atau Realtime Database
    var photoUrl =
        await getPhotoUrlFromDatabase(); // metode untuk memuat URL dari database
    if (photoUrl.isNotEmpty) {
      profile['photoUrl']?.value = photoUrl; // Safe access using ?.value
    }
  }

  // Mengambil URL gambar dari Firebase Storage
  Future<String> getPhotoUrlFromDatabase() async {
    try {
      // Path ke gambar di Firebase Storage
      String photoPath =
          'profile_images/nature-landscape.jpg'; // Ganti dengan nama file yang sesuai

      // Ambil referensi file dari Firebase Storage
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref().child(photoPath);

      // Ambil URL file tersebut
      String downloadURL = await ref.getDownloadURL();

      return downloadURL;
    } catch (e) {
      print("Error getting photo URL: $e");
      return ''; // Kembalikan URL kosong jika terjadi error
    }
  }

  // Fungsi untuk menyimpan perubahan profil ke Firestore
  Future<void> saveProfile(
      String email, String name, String phone, String address) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'email': email,
          'name': name,
          'phone': phone,
          'address': address,
          'photoUrl':
              profile['photoUrl']?.value ?? '', // Safe access with null check
        });
      }
    } catch (e) {
      print("Error saving profile: $e");
    }
  }

  // Memperbarui URL foto di Firestore
  Future<void> updateUserProfilePhoto(String downloadURL) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Simpan URL foto di Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'photoUrl': downloadURL,
        });
      }
    } catch (e) {
      print("Error updating user profile photo: $e");
    }
  }
}
