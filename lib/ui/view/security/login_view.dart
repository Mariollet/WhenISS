/* import 'package:keole/services/app_images.dart';
import 'package:keole/ui/_shared/error_message.dart';
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/extensions/validator.dart";
import "package:keole/services/app_routes.dart";
import "package:keole/services/app_text_styles.dart";
import "package:keole/ui/_shared/custom_button.dart";
import "package:keole/ui/_shared/custom_input.dart";
import "package:keole/ui/_shared/custom_link.dart";
import "package:keole/ui/_shared/custom_scaffold.dart";
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
  Map<String, dynamic>? request;
  String? response;
  bool loading = false;
  bool invalid = false;

  @override
  Widget build(BuildContext context) {
    if (request != null) {
      response = ref.watch(getLoginErrorViewModelProvider(request!));

      if (response != null) {
        loading = false;
        invalid = response != "true";

        if (!invalid) {
          Future(() =>
              Navigator.of(context).pushReplacementNamed(AppRoutes.welcome));
        }

        setState(() {});
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
          const SizedBox(height: 90),
          Form(
            key: loginFormKey,
            child: SizedBox(
              width: 300,
              child: Column(
                children: [
                  Text(
                    "Connexion",
                    style: AppTextStyles.h2,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    "Saisissez votre email et votre mot de passe pour accéder à l'application.",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.p,
                  ),
                  const SizedBox(height: 34),
                  CustomInput(
                    controller: emailController,
                    validator: emailValidator,
                    label: "E-mail",
                    disabled: loading,
                  ),
                  const SizedBox(height: 26),
                  CustomInput(
                    controller: passwordController,
                    validator: passwordValidator,
                    label: "Mot de passe",
                    disabled: loading,
                    isPassword: true,
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomLink(
                      text: "Mot de passe oublié ?",
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.resetPassword),
                    ),
                  ),
                  const SizedBox(height: 30),
                  if (invalid) CustomErrorMessage(response!),
                  CustomButton(
                    text: "Connexion",
                    loading: loading,
                    onPressed: () async {
                      invalid = false;

                      if (loginFormKey.currentState!.validate()) {
                        loading = true;
                        request = {
                          "username": emailController.text,
                          "password": passwordController.text,
                        };
                      }

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
    passwordController.dispose();
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

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Ce champ est requis.";
    }

    return null;
  }
}
 */