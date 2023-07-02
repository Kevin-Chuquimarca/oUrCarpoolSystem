bool isValidEmailInstitutional(String email, String domain) {
  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);
  if (regExp.hasMatch(email)) {
    String emailDomain = email.split('@')[1];
    return emailDomain == domain;
  }
  return false;
}

bool isValidEmail(String email) {
  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(email);
}

bool isValidCI(String value) {
  return value.length == 10 && RegExp(r'^\d+$').hasMatch(value);
}

bool isValidPhoneNumber(String value) {
  return value.length == 10 && RegExp(r'^\d+$').hasMatch(value);
}
