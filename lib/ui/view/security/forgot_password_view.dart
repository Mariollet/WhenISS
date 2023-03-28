import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/shared/button.dart";
import "package:keole/ui/shared/custom_scaffold.dart";
import "package:keole/ui/shared/form_error.dart";
import "package:keole/ui/shared/text_input.dart";
import "package:keole/ui/view_model/login_view_model.dart";

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends ConsumerState<ForgotPasswordView> {
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  Map<String, dynamic>? forgotPasswordResponse;
  bool loading = false;

  @override
  Widget build(BuildContext context) => CustomScaffold(
        isModal: true,
        body: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Mot de passe oublié ?",
                style: TextStyles.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "Si votre e-mail est reconnu, un lien pour renouveler votre mot de passe vous sera envoyé.",
                style: TextStyles.p,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Form(
                key: forgotPasswordFormKey,
                child: TextInput(
                  controller: emailController,
                  validator: emailValidator,
                  placeholder: "E-mail",
                  keyboardType: TextInputType.emailAddress,
                  disabled: loading,
                ),
              ),
              const SizedBox(height: 15),
              if (forgotPasswordResponse?["message"] != null)
                FormError(forgotPasswordResponse!["message"]),
              const SizedBox(height: 15),
              Button(
                width: 300,
                text: "Envoyer",
                loading: loading,
                onPressed: () {
                  if (!forgotPasswordFormKey.currentState!.validate()) return;

                  forgotPasswordResponse = null;
                  loading = true;

                  setState(() {});

                  sendResetPasswordRequest(emailController.text);
                },
              ),
            ],
          ),
        ),
      );

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void sendResetPasswordRequest(String email) async {
    forgotPasswordResponse =
        await ref.read(sendResetPasswordRequestProvider(email));
    loading = false;

    if (!forgotPasswordResponse!["success"]) return setState(() {});
    if (!mounted) return;

    Navigator.of(context).pop();
  }
}
