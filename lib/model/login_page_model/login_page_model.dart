class LoginModel {
  String username;
  String password;

  LoginModel({
    required this.username,
    required this.password,
  });

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
}
