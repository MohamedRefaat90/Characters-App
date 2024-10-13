import 'dart:math';

import 'package:characters_app/core/constants/app_assets.dart';
import 'package:characters_app/core/widgets/btn_loader.dart';
import 'package:characters_app/core/widgets/custom_btn.dart';
import 'package:characters_app/core/widgets/custom_text_field.dart';
import 'package:characters_app/features/auth/presentation/widgets/signup_dialog.dart';
import 'package:characters_app/features/auth/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<AuthScreen> {
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();
  final TextEditingController emailSignupController = TextEditingController();
  final TextEditingController passwordSignupController =
      TextEditingController();
  final TextEditingController nameSignupController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ref.watch(authProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
              bottom: -80,
              right: -100,
              child: Image.asset(
                AppAssets.pokemonAuthLogo,
                width: 300,
              )),
          Positioned(
              top: -10,
              right: 80,
              child: Transform.rotate(
                angle: -pi / 300.0,
                child: Image.asset(
                  'assets/images/auth/3.png',
                  width: 250,
                ),
              )),
          Positioned(
              bottom: -40,
              left: -40,
              child: Transform.rotate(
                angle: pi / 5,
                child: Image.asset(
                  'assets/images/auth/pichu.png',
                  width: 250,
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to Characters App",
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        placeholderText: "Email",
                        textEditingController: emailLoginController,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        placeholderText: "Password",
                        textEditingController: passwordLoginController,
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                CustomBTN(
                    widget:
                        ref.watch(authProvider) ? BtnLoader() : Text("Login"),
                    color: Colors.amber,
                    width: 150,
                    padding: 14,
                    press: () {
                      if (formKey.currentState!.validate()) {
                        ref.watch(authProvider.notifier).login(
                            emailLoginController.text.trim().toLowerCase(),
                            passwordLoginController.text,
                            context);
                      }
                    }),
                TextButton(
                  child: const Text(
                    "Signup",
                    style: TextStyle(color: Colors.blue, fontSize: 17),
                  ),
                  onPressed: () {
                    signupDialog(
                        context,
                        [
                          emailSignupController,
                          nameSignupController,
                          passwordSignupController
                        ],
                        ref);
                  },
                )
              ],
            ),
          ),
        ],
      )),
    );
  }

  @override
  void dispose() {
    emailLoginController.dispose();
    passwordLoginController.dispose();
    emailSignupController.dispose();
    passwordSignupController.dispose();
    nameSignupController.dispose();
    super.dispose();
  }
}
