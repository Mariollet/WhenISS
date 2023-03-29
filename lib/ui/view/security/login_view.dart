import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/services/services.dart";
import "package:keole/ui/shared/button.dart";
import "package:keole/ui/shared/custom_scaffold.dart";
import "package:keole/ui/shared/form_error.dart";
import "package:keole/ui/shared/link.dart";
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
  Map<String, dynamic>? loginResponse;
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
                style: TextStyles.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                "Saisissez votre e-mail et votre\nmot de passe pour accéder à\nl'application.",
                style: TextStyles.p,
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
                      placeholder: "E-mail",
                      keyboardType: TextInputType.emailAddress,
                      disabled: loading,
                    ),
                    const SizedBox(height: 15),
                    TextInput(
                      controller: passwordController,
                      validator: requiredValidator,
                      placeholder: "Mot de passe",
                      disabled: loading,
                      obscured: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Link(
                  text: "Mot de passe oublié ?",
                  disabled: loading,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.forgotPassword),
                ),
              ),
              const SizedBox(height: 15),
              if (loginResponse?["success"] == false)
                FormError(loginResponse?["message"]),
              const SizedBox(height: 15),
              Button(
                width: 300,
                text: "Se connecter",
                loading: loading,
                onPressed: () {
                  if (!loginFormKey.currentState!.validate()) return;

                  loginResponse = null;
                  loading = !loading;

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
    loginResponse = await ref.read(loginProvider({
      "username": email,
      "password": password,
    }));
    loading = false;

    if (loginResponse?["success"] == false) return setState(() {});
    if (!mounted) return;

    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }
}
