/* import "package:keole/extensions/validator.dart";
import 'package:keole/services/app_images.dart';
import "package:keole/services/app_text_styles.dart";
import "package:keole/ui/_shared/custom_button.dart";
import "package:keole/ui/_shared/custom_input.dart";
import "package:keole/ui/_shared/custom_scaffold.dart";
import 'package:keole/ui/_shared/error_message.dart';
import "package:keole/ui/view_model/login_view_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ResetPasswordView extends ConsumerStatefulWidget {
  const ResetPasswordView({super.key});

  @override
  ResetPasswordState createState() => ResetPasswordState();
}

class ResetPasswordState extends ConsumerState<ResetPasswordView> {
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  String? email;
  String? isEmailError;

  @override
  Widget build(BuildContext context) {
    if (email != null) {
      isEmailError = ref.watch(hasResetPasswordErrorViewModelProvider(email!));

      if (isEmailError is! String) {
        Future(() => Navigator.of(context).pop());
      }
    }

    return CustomScaffold(
      appBarLogo: false,
      bottomBarType: BottomBarType.copyright,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.logo,
            height: 140,
          ),
          const SizedBox(height: 80),
          Form(
            key: resetPasswordFormKey,
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Mot de passe oublié",
                    style: AppTextStyles.h2,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Si votre adresse e-mail est reconnue, un lien pour renouveler votre mot de passe vous sera envoyé.",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.p,
                  ),
                  const SizedBox(height: 28),
                  CustomInput(
                    controller: emailController,
                    validator: emailValidator,
                    label: "E-mail",
                  ),
                  const SizedBox(height: 80),
                  if (isEmailError != null) CustomErrorMessage(isEmailError!),
                  CustomButton(
                    text: "Réinitialiser",
                    onPressed: () {
                      if (!resetPasswordFormKey.currentState!.validate()) {
                        return;
                      }

                      email = emailController.text;

                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Ce champ est requis.";
    }

    if (!value.isValidEmail()) {
      return "Veuillez saisir un e-mail valide.";
    }

    return null;
  }
}
 */