import 'package:calendar_rise/interfaces/auth_service_interface.dart';
import 'package:calendar_rise/models/authorized_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService implements AuthService {
  @override
  Future<AuthorizedUser> signIn() async {
    const String calendarScope = 'https://www.googleapis.com/auth/calendar';
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: [calendarScope],
    ).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);

    return AuthorizedUser(
        googleUser.id,
        googleUser.email,
        googleUser.displayName,
        googleUser.photoUrl,
        googleAuth.accessToken!,
        googleAuth.idToken);
  }
}
