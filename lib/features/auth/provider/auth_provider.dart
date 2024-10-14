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
  final AuthRepo authRepo;
  AuthNotifier(this.authRepo) : super(false);

  Future<UserModel?> login(
      String email, String password, BuildContext context) async {
    try {
      state = true;
      final UserModel user = await authRepo.login(email, password);
      await SecureStorage.write('token', user.token);
      state = false;
      if (context.mounted) {
        context.goNamed(AppRouting.home);
      }
      return user;
    } on DioException catch (e) {
      state = false;
      if (context.mounted) {
        flushBar(
            context: context,
            message: e.response!.data['detail'] ?? "Unkonw Error");
      }
      return null;
    }
  }

  Future<void> signup(UserinputModel userData, BuildContext context) async {
    try {
      state = true;
      await authRepo.signup(userData);
      state = false;
      if (context.mounted) {
        context.pop();
      }
    } on DioException catch (e) {
      state = false;
      if (context.mounted) {
        flushBar(context: context, message: e.response!.statusMessage);
      }
    }
  }

  logout(BuildContext context) async {
    try {
      await authRepo.logout();

      await SecureStorage.delete('token');
      if (context.mounted) context.goNamed(AppRouting.auth);
    } on DioException catch (e) {
      if (context.mounted) {
        flushBar(context: context, message: e.response!.statusMessage);
      }
    }
  }
}
