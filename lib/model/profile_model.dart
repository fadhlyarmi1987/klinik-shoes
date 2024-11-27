// lib/models/user_profile.dart

class UserProfile {
  String id;
  String email;
  String name;
  String phone;
  String address;
  String? photoUrl; // Tambahkan photoUrl jika ada foto profil

  UserProfile({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.address,
    this.photoUrl,
  });

  // Fungsi untuk memetakan data dari Firebase Firestore
  factory UserProfile.fromMap(Map<String, dynamic> data, String id) {
    return UserProfile(
      id: id,
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      phone: data['phone'] ?? '',
      address: data['address'] ?? '',
      photoUrl: data['photoUrl'],
    );
  }

  // Fungsi untuk memetakan data kembali ke map untuk disimpan di Firestore
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'address': address,
      'photoUrl': photoUrl,
    };
  }
}
