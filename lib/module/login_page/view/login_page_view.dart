import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:klinik_shoes_project/core.dart';
import 'package:klinik_shoes_project/module/login_page/controller/login_page_controller.dart';
import 'package:get/get.dart' as getX;

class LoginPageView extends StatelessWidget {
  final LoginController controller = getX.Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _buildBackground(),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('asset/logo_klinik_shoes.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  _buildTextField(
                    hintText: 'Username or Email',
                    iconPath: 'asset/user.png',
                    onChanged: (value) => controller.setEmail(value),
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    hintText: 'Password',
                    iconPath: 'asset/lock1.png',
                    obscureText: true,
                    onChanged: (value) => controller.setPassword(value),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Forgot password action
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('- OR Continue with -',
                      style: TextStyle(color: Colors.black45)),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(
                        assetPath: 'asset/Google.png',
                        onTap: () {
                          print("Login with Google");
                        },
                      ),
                      SizedBox(width: 20),
                      _buildSocialButton(
                        assetPath: 'asset/Facebook.png',
                        onTap: () {
                          print("Login with Facebook");
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  GestureDetector(
                    onTap: () async {
                      User? user = await controller.loginWithEmailPassword();
                      if (user != null) {
                        // Navigasi ke homepage jika login berhasil
                        getX.Get.offAll(() => HomePageView(
                            controller:
                                HomePageController())); // Menghapus semua halaman sebelumnya dan menuju ke Homepage
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login successful!')),
                        );
                      } else {
                        // Jika login gagal
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login failed!')),
                        );
                      }
                    },
                    child: Container(
                      // Kontainer Tombol Login
                      width: 350,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 109, vertical: 5),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 5, color: Color(0xFFBEF2EE)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x7F000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      getX.Get.toNamed('/signup');
                    },
                    child: Text('Don’t have an account? Sign up here'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to create text field with PNG icons
  Widget _buildTextField({
    required String hintText,
    required String iconPath,
    bool obscureText = false,
    required ValueChanged<String> onChanged,
  }) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent, // Transparent background
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black54), // Hint text color
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0), // Padding around the icon
          child: Image.asset(
            iconPath, // Use PNG image as icon
            width: 24, // Width of the image
            height: 24, // Height of the image
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
          borderSide: BorderSide(color: Colors.black), // Border color
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 20), // Vertical padding
      ),
      style: TextStyle(color: Colors.black), // Input text color
    );
  }

  // Function to create social login buttons
  Widget _buildSocialButton(
      {required String assetPath, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(assetPath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // Function to create background with decorative circles
  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(234, 251, 249, 1), // Background color
      ),
      child: Stack(
        children: [
          // Decorative circle in the top left
          Positioned(
            top: -9,
            left: -78,
            child: Container(
              width: 300,
              height: 300,
              decoration: ShapeDecoration(
                color: Color(0xFF29D6C8),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            top: 34,
            left: -41,
            child: Container(
              width: 140,
              height: 140,
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(
                    width: 5,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFF7EE6DE),
                  ),
                ),
              ),
            ),
          ),
          // Decorative circle in the bottom left
          Positioned(
            top: 216,
            left: 67,
            child: Container(
              width: 432,
              height: 432,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF29D6C8),
              ),
            ),
          ),
          Positioned(
            top: 291,
            left: 283,
            child: Container(
              width: 150,
              height: 150,
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(
                    width: 5,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFA9EEE9),
                  ),
                ),
              ),
            ),
          ),
          // Decorative circle in the bottom right
          Positioned(
            top: 561,
            left: -97,
            child: Container(
              width: 300,
              height: 300,
              decoration: ShapeDecoration(
                color: Color(0xFF29D6C8),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            top: 503,
            left: -8,
            child: Container(
              width: 230,
              height: 228,
              decoration: ShapeDecoration(
                shape: OvalBorder(
                  side: BorderSide(
                    width: 5,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFF7EE6DE),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
