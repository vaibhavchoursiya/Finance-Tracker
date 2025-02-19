class Validators {
  static String? validateString(String? value) {
    if (value == null || value.isEmpty) {
      return "field is required";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (!value!.contains("@")) {
      return "enter valid email.";
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.length < 8) {
      return "Password must be at least 8 characters long.";
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return "Password must contain at least one uppercase letter.";
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return "Password must contain at least one lowercase letter.";
    }
    if (!RegExp(r'\d').hasMatch(password)) {
      return "Password must contain at least one number.";
    }
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return "Password must contain at least one special character.";
    }
    return null; // Password is valid
  }

  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return "field is required";
    } else if (double.tryParse(value) == null) {
      return "enter valid amount";
    } else if (double.parse(value) < 0.0) {
      return "enter amount > 0.0";
    }
    return null;
  }
}
