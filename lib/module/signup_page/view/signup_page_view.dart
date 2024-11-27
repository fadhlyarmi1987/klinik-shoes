import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/signup_page_controller.dart';

class SignupPageView extends StatelessWidget {
  final SignupPageController controller = Get.put(SignupPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _buildBackground(),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogo(),
                  const SizedBox(height: 30),
                  _buildTextField(
                    hintText: 'Username or Email',
                    iconPath: 'asset/user.png',
                    onChanged: controller.setUsername,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    hintText: 'Password',
                    iconPath: 'asset/lock1.png',
                    obscureText: true,
                    onChanged: controller.setPassword,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    hintText: 'Confirm Password',
                    iconPath: 'asset/lock1.png',
                    obscureText: true,
                    onChanged: controller.setConfirmPassword,
                  ),
                  const SizedBox(height: 16),
                  const Text('OR Continue with',
                      style: TextStyle(color: Colors.black45)),
                  const SizedBox(height: 16),
                  _buildSocialButtons(),
                  const SizedBox(height: 32),
                  _buildSignUpButton(context),
                  const SizedBox(height: 16),
                  _buildLoginButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 300,
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('asset/logo_klinik_shoes.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

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
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black54),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          assetPath: 'asset/Google.png',
          onTap: () => print("Login with Google"),
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          assetPath: 'asset/Facebook.png',
          onTap: () => print("Login with Facebook"),
        ),
      ],
    );
  }

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

  Widget _buildSignUpButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await controller.signup();
      },
      child: const Text('Sign Up'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      ),
    );
  }

  Widget _buildLoginButton() {
    return TextButton(
      onPressed: () {
        Get.toNamed('/login');
      },
      child: const Text('Already have an account? Login here'),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(234, 251, 249, 1),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -111,
            left: -279,
            child: _buildCircle(461, const Color(0xFF29D6C8)),
          ),
          Positioned(
            top: 16,
            left: -84,
            child: _buildBorderedCircle(150, const Color(0xFF7EE6DE)),
          ),
          Positioned(
            top: 207,
            left: 219,
            child: _buildCircle(280, const Color(0xFF29D6C8)),
          ),
          Positioned(
            top: 166,
            left: 300,
            child: _buildBorderedCircle(150, const Color(0xFFA9EEE9)),
          ),
          Positioned(
            top: 484,
            left: -253,
            child: _buildCircle(461, const Color(0xFF29D6C8)),
          ),
        ],
      ),
    );
  }

  Widget _buildCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Widget _buildBorderedCircle(double size, Color borderColor) {
    return Container(
      width: size,
      height: size,
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(
            width: 5,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
