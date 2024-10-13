import 'package:characters_app/core/network/api_endpoints.dart';
import 'package:characters_app/core/network/api_handler.dart';
import 'package:characters_app/features/auth/data/models/user_model.dart';
import 'package:characters_app/features/auth/data/models/userinput_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepo = Provider<AuthRepo>((ref) {
  return AuthRepo(ref.read(apiHandlerProvider));
});

class AuthRepo {
  final ApiHandler apiHandler;

  AuthRepo(this.apiHandler);

  Future<UserModel> login(String email, String password) async {
    Response response = await apiHandler
        .post(ApiEndpoints.login, data: {'email': email, 'password': password});

    return UserModel.fromJson(response.data);
  }

  Future<void> signup(UserinputModel user) async {
    await apiHandler.post(ApiEndpoints.signup, data: {
      'email': user.email,
      'password': user.password,
      'name': user.name
    });
  }

  logout() async {
    await apiHandler.post(ApiEndpoints.logout);
  }
}
