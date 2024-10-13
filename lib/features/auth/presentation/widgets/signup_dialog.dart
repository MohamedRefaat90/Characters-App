import 'package:characters_app/core/widgets/btn_loader.dart';
import 'package:characters_app/core/widgets/custom_text_field.dart';
import 'package:characters_app/features/auth/data/models/userinput_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/widgets/custom_btn.dart';
import '../../provider/auth_provider.dart';

Future<dynamic> signupDialog(BuildContext context,
    List<TextEditingController> controllers, WidgetRef ref) {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    constraints: const BoxConstraints(maxHeight: double.infinity),
    builder: (context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text('Signup', style: GoogleFonts.abel(fontSize: 25)),
            const SizedBox(height: 15),
            CustomTextField(
              placeholderText: "Email",
              textEditingController: controllers[0],
            ),
            const SizedBox(height: 10),
            CustomTextField(
              placeholderText: "name",
              textEditingController: controllers[1],
            ),
            const SizedBox(height: 10),
            CustomTextField(
              placeholderText: "Password",
              isPassword: true,
              textEditingController: controllers[2],
            ),
            const SizedBox(height: 30),
            Consumer(
              builder: (context, ref, child) {
                final authLoading = ref.watch(authProvider);
                return CustomBTN(
                    widget:
                        authLoading ? const BtnLoader() : const Text("Signup"),
                    width: 150,
                    padding: 15,
                    color: Colors.blueGrey[800],
                    press: () {
                      if (formKey.currentState!.validate()) {
                        ref.read(authProvider.notifier).signup(
                            UserinputModel(
                                email: controllers[0].text.toLowerCase().trim(),
                                name: controllers[1].text,
                                password: controllers[2].text),
                            context);
                      }
                    });
              },
            ),
            const Spacer(),
            TextButton(
                child: const Text('Close',
                    style: TextStyle(color: Colors.red, fontSize: 18)),
                onPressed: () => context.pop())
          ],
        ),
      ),
    ),
  );
}
