import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:fl_starter/env.dart";
import "package:fl_starter/services/index.dart";
import "package:fl_starter/ui/shared/index.dart";
import "package:fl_starter/ui/view_model/index.dart";

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(
      text: Environment.appDebug ? Environment.appDebugEmail : ''),
      passwordController = TextEditingController(
      text: Environment.appDebug ? Environment.appDebugPassword : '');
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
                localizations.loginTitle,
                style: AppTextStyles.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                localizations.loginDescription,
                style: AppTextStyles.p,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Form(
                key: loginFormKey,
                child: Column(
                  children: [
                    TextInput(
                      controller: emailController,
                      validator: emailValidator,
                      placeholder: localizations.placeholderEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    TextInput(
                      controller: passwordController,
                      validator: requiredValidator,
                      placeholder: localizations.placeholderPassword,
                      obscured: true,
                      onSubmitted: (_) => submit(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Link(
                  onPressed: () => Navigator.of(context).pushNamed(
                    AppRoutes.forgotPassword,
                  ),
                  child: Text(
                    localizations.loginForgotPassword,
                    style: AppTextStyles.link,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FormError(error),
              const SizedBox(height: 15),
              Button(
                size: ButtonSize.m,
                text: localizations.commonLogIn,
                loading: loading,
                onPressed: submit,
              ),
            ],
          ),
        ),
      );

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submit() {
    if (!loginFormKey.currentState!.validate()) return;

    login(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  void login({
    required final String email,
    required final String password,
  }) async {
    error = null;
    loading = true;

    setState(() {});

    try {
      await ref.read(loginProvider({
        "username": email,
        "password": password,
      }).future);

      if (!mounted) return;

      Navigator.of(context).pushNamed(AppRoutes.home);
    } on Exception catch (error) {
      this.error = error;
      loading = false;

      setState(() {});
    }
  }
}
