
extension ValidationExtension on String {

  bool get isPhoneValidate => (startsWith("5") && length == 9);

  bool get isEmailValid {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(this);
  }

}