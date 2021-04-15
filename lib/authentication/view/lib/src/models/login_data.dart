import 'package:quiver/core.dart';

class LoginData {
  final String userID;
  final String mobile;

  LoginData({
    required this.userID,
    required this.mobile,
  });

  @override
  String toString() {
    return '$runtimeType($userID, $mobile)';
  }

  @override
  bool operator ==(Object other) {
    if (other is LoginData) {
      return userID == other.userID && mobile == other.mobile;
    }
    return false;
  }

  @override
  int get hashCode => hash2(userID, mobile);
}
