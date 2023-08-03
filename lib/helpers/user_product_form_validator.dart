class UserProductValidation {
  static String? validateName(value) {
    if (value.isEmpty || value == null) {
      return "Name cannot be empty";
    }
    return null;
  }

  static String? validatePrice(value) {
    if (value.isEmpty || value == "0.0" || value == null) {
      return "You are selling the prodcut for free?";
    } else if (double.tryParse(value) == null) {
      return "The price must be a number";
    }

    return null;
  }
}
