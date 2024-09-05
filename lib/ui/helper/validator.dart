class Validator {
  static isNumber(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      final number = int.tryParse(value);
      if (number == null) {
        return false;
      } else {
        return true;
      }
    }
  }

  static isDouble(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      final number = num.tryParse(value);
      if (number == null) {
        return false;
      } else {
        return true;
      }
    }
  }

  static bool isEmail(String value) {
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (emailRegex.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static bool isPassword(String value) {
    if (value.length > 6) {
      return true;
    }
    return false;
  }
}
