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

    if (double.parse(value) < 0) {
      return "Negative Pricing ? You want loss ? ";
    }
    return null;
  }

  static String? validateDescription(value) {
    if (value.isEmpty) {
      return "Please describe your prodcut";
    } else if (value.toString().length < 10) {
      return "Description must be min 10 char long";
    }
    return null;
  }
}
