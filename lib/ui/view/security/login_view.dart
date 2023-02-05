import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/services/app_routes.dart";
import "package:keole/services/app_text_styles.dart";
import "package:keole/ui/shared/button.dart";
import "package:keole/ui/shared/custom_scaffold.dart";
import "package:keole/ui/shared/form_error.dart";
import "package:keole/ui/shared/text_input.dart";
import "package:keole/ui/view_model/login_view_model.dart";

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends ConsumerState<LoginView> {
  final GlobalKey<FormState> loginFormKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  dynamic loginResponse;
  bool loading = false;

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Connexion à votre espace personnel",
                style: AppTextStyles.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "Saisissez votre e-mail et votre mot de passe pour accéder à l'application.",
                style: AppTextStyles.p,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Form(
                key: loginFormKey,
                child: Column(
                  children: [
                    TextInput.email(
                      controller: emailController,
                      disabled: loading,
                    ),
                    const SizedBox(height: 30),
                    TextInput.password(
                      controller: passwordController,
                      disabled: loading,
                      obscured: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: Button(
                  text: "Mot de passe oublié",
                  onPressed: () => Navigator.of(context).pushNamed(
                    AppRoutes.forgotPassword,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              if (loginResponse is String) FormError(loginResponse),
              const SizedBox(height: 15),
              Button(
                text: "Se connecter",
                loading: loading,
                onPressed: () {
                  if (!loginFormKey.currentState!.validate()) return;

                  loginResponse = null;
                  loading = true;

                  setState(() {});

                  login(emailController.text, passwordController.text);
                },
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

  void login(String email, String password) async {
    final loginResponse = await ref.read(loginProvider({
      "username": email,
      "password": password,
    }));

    if (loginResponse is String) {
      loading = false;

      return setState(() {});
    }

    if (!mounted) return;

    print("Logged!");

    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }
}
