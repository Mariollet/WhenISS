import "package:flutter/cupertino.dart";
import "package:keole/services/index.dart";

class FormError extends StatelessWidget {
  const FormError(this.error, {super.key});

  final dynamic error;

  @override
  Widget build(final BuildContext context) {
    if (error is! Exception) return const SizedBox();

    return Text.rich(
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
          TextSpan(text: error.message),
        ],
      ),
      style: AppTextStyles.formError,
      textAlign: TextAlign.center,
    );
  }
}
