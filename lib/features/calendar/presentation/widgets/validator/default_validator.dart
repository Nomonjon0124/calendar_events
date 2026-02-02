class NotEmptyValidator {
  static String? validate(String? value) {
    String? errorMessage;
    if (value == null || value.trim().isEmpty) {
      errorMessage = "Myodn bo'sh bo'lishi mumkin emas!";
    }
    return errorMessage;
  }
}
