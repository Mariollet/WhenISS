import "package:flutter/cupertino.dart";
import "package:wheniss/services/index.dart";

class FormError extends StatelessWidget {
  const FormError(this.error, {super.key});

  final dynamic error;

  @override
  Widget build(final BuildContext context) {
    if (error is! Exception) return const SizedBox();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const Icon(
        CupertinoIcons.clear_circled_solid,
        size: 16,
        color: AppColors.error,
      ),
      const SizedBox(width: 6),
      Flexible(
        child: Text(
        error.message,
        style: AppTextStyles.formError,
        ),
      ),
      ],
    );
  }
}
