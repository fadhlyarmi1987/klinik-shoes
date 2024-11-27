import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignupPageController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Observables for username/email, password, and confirm password
  var username = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var isLoading = false.obs;

  // Method to set the username/email
  void setUsername(String value) {
    username.value = value;
  }

  // Method to set the password
  void setPassword(String value) {
    password.value = value;
  }

  // Method to set the confirm password
  void setConfirmPassword(String value) {
    confirmPassword.value = value;
  }

  // Function to sign up with email and password, with confirm password check
  Future<void> signup() async {
    if (password.value != confirmPassword.value) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    isLoading.value = true;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: username.value, // Assuming username here is the email
        password: password.value,
      );
      Get.snackbar('Success', 'Account created successfully');
      Get.offAllNamed('/login');
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'This email is already in use. Please try another.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format.';
          break;
        case 'weak-password':
          errorMessage = 'Password should be at least 6 characters.';
          break;
        default:
          errorMessage = 'An unexpected error occurred. Please try again.';
          break;
      }
      Get.snackbar('Error', errorMessage);
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }
}
