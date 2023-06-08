import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";
import "package:keole/env.dart";
import "package:keole/services/index.dart";
import "package:keole/ui/shared/index.dart";
import "package:keole/ui/view_model/index.dart";

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController emailController =
      TextEditingController(text: Environment.appDebugEmail);
  Exception? error;
  bool loading = false;

  @override
  Widget build(final BuildContext context) => AppScaffold(
        appBar: true,
        bottomBar: true,
        body: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localizations.forgotPasswordTitle,
                style: AppTextStyles.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                localizations.forgotPasswordDescription,
                style: AppTextStyles.p,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Form(
                key: forgotPasswordFormKey,
                child: TextInput(
                  controller: emailController,
                  validator: emailValidator,
                  placeholder: localizations.placeholderEmail,
                  keyboardType: TextInputType.emailAddress,
                  disabled: loading,
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Link(
                  text: localizations.forgotPasswordLogin,
                  disabled: loading,
                  onPressed: () => Navigator.of(context).pushReplacementNamed(
                    AppRoutes.login,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FormError(error),
              const SizedBox(height: 15),
              Button(
                size: ButtonSize.m,
                text: localizations.commonSend,
                loading: loading,
                onPressed: () => sendResetPasswordRequest(
                  email: emailController.text,
                ),
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

  void sendResetPasswordRequest({required final String email}) async {
    if (!forgotPasswordFormKey.currentState!.validate()) return;

    error = null;
    loading = true;

    setState(() {});

    try {
      await ref.read(resetPasswordProvider(email).future);

      showSnackBar(localizations.snackBarForgotPassword);

      if (!mounted) return;

      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
    } on Exception catch (error) {
      this.error = error;
      loading = false;

      setState(() {});
    }
  }
}
