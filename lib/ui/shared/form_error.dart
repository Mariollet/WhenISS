import "package:flutter/cupertino.dart";
import "package:keole/services/services.dart";

class FormError extends StatelessWidget {
  const FormError(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) => Text.rich(
        TextSpan(
          children: [
            const WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Padding(
                padding: EdgeInsets.only(right: 2),
                child: Icon(
                  CupertinoIcons.clear_circled_solid,
                  size: 16,
                  color: AppColors.error,
                ),
              ),
            ),
            TextSpan(text: message),
          ],
        ),
        style: AppTextStyles.formError,
        textAlign: TextAlign.center,
      );
}
