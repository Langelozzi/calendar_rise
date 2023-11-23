import 'package:calendar_rise/models/authorized_user.dart';

abstract class AuthService {
  Future<AuthorizedUser> signIn();
  signOut();
}
