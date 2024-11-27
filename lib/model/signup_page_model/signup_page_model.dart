class SignupModel {
  String username = '';
  String password = '';
  String confirmPassword = '';

  String? validateUsername() {
    if (username.isEmpty) {
      return 'Username atau Email tidak boleh kosong';
    }
    return null;
  }

  String? validatePassword() {
    if (password.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (password.length < 6) {
      return 'Password harus terdiri dari minimal 6 karakter';
    }
    return null;
  }

  String? validateConfirmPassword() {
    if (confirmPassword.isEmpty) {
      return 'Konfirmasi Password tidak boleh kosong';
    } else if (confirmPassword != password) {
      return 'Password tidak cocok';
    }
    return null;
  }
}
