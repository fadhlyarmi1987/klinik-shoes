import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_shoes_project/module/profile_page/controller/edit_profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  final EditProfileController controller = Get.put(EditProfileController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller
        .loadProfile(); // Memuat data profil saat halaman pertama kali dibuka

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Profile'),
        actions: [
          TextButton(
            onPressed: () {
              controller.saveProfile(
                emailController.text,
                nameController.text,
                phoneController.text,
                addressController.text,
              );
            },
            child: Text('Save', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Obx(() {
          // Set nilai awal TextEditingController hanya jika belum diset
          if (emailController.text.isEmpty &&
              controller.profile['email']?.value.isNotEmpty == true) {
            emailController.text = controller.profile['email']?.value ?? '';
          }
          if (nameController.text.isEmpty &&
              controller.profile['name']?.value.isNotEmpty == true) {
            nameController.text = controller.profile['name']?.value ?? '';
          }
          if (phoneController.text.isEmpty &&
              controller.profile['phone']?.value.isNotEmpty == true) {
            phoneController.text = controller.profile['phone']?.value ?? '';
          }
          if (addressController.text.isEmpty &&
              controller.profile['address']?.value.isNotEmpty == true) {
            addressController.text = controller.profile['address']?.value ?? '';
          }

          return Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: (controller
                            .profile['photoUrl']?.value.isNotEmpty ??
                        false)
                    ? NetworkImage(controller.profile['photoUrl']?.value ?? '')
                    : AssetImage('assets/profile_placeholder.png')
                        as ImageProvider,
              ),
              TextButton.icon(
                onPressed: () {
                  controller.selectAndUploadProfileImage();
                },
                icon: Icon(Icons.camera_alt),
                label: Text('Change Photo'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your new email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your new phone number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Enter your new address',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          );
        }),
      ),
    );
  }
}
