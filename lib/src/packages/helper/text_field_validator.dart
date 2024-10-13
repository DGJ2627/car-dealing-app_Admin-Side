import '../resources/app_constants.dart';

String? textFieldValidator(String fieldName, String? value) {
  value = value?.trim() ?? "";
  switch (fieldName) {
    case 'email':
      if (value.isEmpty) return 'email cannot be empty';
      if (!AppConstants.emailPatternRegExp.hasMatch(value)) {
        return 'enter valid email address!';
      }
      break;
    case 'fulName':
      if (value.isEmpty) return 'Name cannot be empty';
      if (!AppConstants.userNamePatternRegExp.hasMatch(value)) {
        return 'enter valid Name address!';
      }
      break;
    case 'password':
      if (value.isEmpty) return 'Password cannot be empty';
      if (!AppConstants.passwordPatternRegExp.hasMatch(value)) {
        return 'enter valid Password address!';
      }
      break;
    case 'contactNumber':
      if (value.isEmpty) return 'Mobile No cannot be empty';
      if (!AppConstants.mobileNoPatternRegExp.hasMatch(value)) {
        return 'enter valid Mobile No address!';
      }
      break;
  }
  return null;
}
