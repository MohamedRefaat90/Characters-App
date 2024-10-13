import 'package:characters_app/core/constants/app_routings.dart';
import 'package:characters_app/core/helpers/flushbar.dart';
import 'package:characters_app/core/services/secure_storage.dart';
import 'package:characters_app/features/auth/data/models/user_model.dart';
import 'package:characters_app/features/auth/data/models/userinput_model.dart';
import 'package:characters_app/features/auth/data/repo/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier(ref.read(authRepo));
});

class AuthNotifier extends StateNotifier<bool> {
  final AuthRepo loginRepo;
  AuthNotifier(this.loginRepo) : super(false);

  Future<UserModel?> login(
      String email, String password, BuildContext context) async {
    try {
      final UserModel user = await loginRepo.login(email, password);
      state = true;
      SecureStorage.write('token', user.token);
      if (context.mounted) {
        context.goNamed(AppRouting.home);
      }
      return user;
    } on DioException catch (e) {
      if (context.mounted) {
        flushBar(context: context, message: e.response!.data['detail']);
      }
      return null;
    }
  }

  Future<void> signup(UserinputModel userData, BuildContext context) async {
    try {
      state = !state;
      await loginRepo.signup(userData);
      state = !state;
      if (context.mounted) {
        context.pop();
      }
    } on DioException catch (e) {
      if (context.mounted) {
        flushBar(context: context, message: e.response!.statusMessage);
      }
    }
  }

  logout(BuildContext context) {
    SecureStorage.delete('token');
    context.goNamed(AppRouting.auth);
  }
}
