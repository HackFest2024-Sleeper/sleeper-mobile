// ignore_for_file: prefer_const_declarations, library_private_types_in_public_api

class ApiEndpoints {
  static final String baseUrl = 'http://10.0.2.2:9000/'; //localhost
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String register = 'auth/register';
}