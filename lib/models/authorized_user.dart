class AuthorizedUser {
  String id;
  String email;
  String? displayName;
  String? photoUrl;

  String accessToken;
  String? serverAuthCode;
  String? idToken;

  AuthorizedUser(this.id, this.email, this.displayName, this.photoUrl,
      this.accessToken, this.idToken);
}
