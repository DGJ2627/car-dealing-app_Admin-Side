import '../resources/app_constants.dart';

enum FieldType {
  email,
  fullName,
  password,
  contactNumber,
  showroomName,
  ownerName,
  licenseNumber,
  location,
  verificationDocuments,
  brand,
  showroomId,
  carName,
  type,
  originalPrice,
  warranty,
  engine,
  power,
  photo,
  transMission,
  mileage,
  specialFeature,
  fuelType,
  insurance,
  quantity,
}

abstract interface class InputValidator {
  static final _validators = {
    FieldType.fullName: (value) => value.isEmpty
        ? 'Name cannot be empty'
        : (AppConstants.userNamePatternRegExp.hasMatch(value)
            ? null
            : 'enter valid Name address!'),
    FieldType.password: (value) => value.isEmpty
        ? 'Password cannot be empty'
        : (AppConstants.passwordPatternRegExp.hasMatch(value)
            ? null
            : 'enter valid Password address!'),
    FieldType.contactNumber: (value) => value.isEmpty
        ? 'Mobile No cannot be empty'
        : (AppConstants.mobileNoPatternRegExp.hasMatch(value)
            ? null
            : 'enter valid Mobile No address!'),
    FieldType.showroomName: (value) =>
        value.isEmpty ? 'showroomName cannot be empty' : null,
    FieldType.ownerName: (value) =>
        value.isEmpty ? 'ownerName cannot be empty' : null,
    FieldType.licenseNumber: (value) => value.isEmpty
        ? 'licenseNumber cannot be empty'
        : (AppConstants.licenseNoPatternRegExp.hasMatch(value)
            ? null
            : 'enter valid License No!'),
    FieldType.location: (value) =>
        value.isEmpty ? 'location No cannot be empty' : null,
    FieldType.verificationDocuments: (value) =>
        value.isEmpty ? 'verificationDocuments cannot be empty' : null,
    FieldType.brand: (value) => value.isEmpty ? 'brand cannot be empty' : null,
    FieldType.email: (value) => value.isEmpty
        ? 'email cannot be empty'
        : (AppConstants.emailPatternRegExp.hasMatch(value)
            ? null
            : 'enter valid email address!'),
  };

  static String? textFieldValidator(FieldType fieldType, String? value) {
    value = value?.trim() ?? "";
    return _validators[fieldType]?.call(value);
  }
}

/// =========================================
// String? textFieldValidator(String fieldName, String? value) {
//   value = value?.trim() ?? "";
//   switch (fieldName) {
//     case 'email':
//       if (value.isEmpty) return 'email cannot be empty';
//       if (!AppConstants.emailPatternRegExp.hasMatch(value)) {
//         return 'enter valid email address!';
//       }
//       break;
//     case 'fulName':
//       if (value.isEmpty) return 'Name cannot be empty';
//       if (!AppConstants.userNamePatternRegExp.hasMatch(value)) {
//         return 'enter valid Name address!';
//       }
//       break;
//     case 'password':
//       if (value.isEmpty) return 'Password cannot be empty';
//       if (!AppConstants.passwordPatternRegExp.hasMatch(value)) {
//         return 'enter valid Password address!';
//       }
//       break;
//     case 'contactNumber':
//       if (value.isEmpty) return 'Mobile No cannot be empty';
//       if (!AppConstants.mobileNoPatternRegExp.hasMatch(value)) {
//         return 'enter valid Mobile No address!';
//       }
//       break;
//
//     //
//
//     case 'showroomName':
//       if (value.isEmpty) return 'showroomName cannot be empty';
//
//       break;
//     case 'ownerName':
//       if (value.isEmpty) return 'ownerName cannot be empty';
//
//       break;
//     case 'licenseNumber':
//       if (value.isEmpty) return 'licenseNumber cannot be empty';
//
//       break;
//     case 'location':
//       if (value.isEmpty) return 'location No cannot be empty';
//
//       break;
//     case 'verificationDocuments':
//       if (value.isEmpty) return 'verificationDocuments cannot be empty';
//
//       break;
//     case 'brand':
//       if (value.isEmpty) return 'brand cannot be empty';
//
//       break;
//   }
//   return null;
// }
