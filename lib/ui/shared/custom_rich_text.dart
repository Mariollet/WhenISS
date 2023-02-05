/* import "package:flutter/material.dart";
import "package:keole/services/app_text_styles.dart";

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    this.text,
    this.style,
    this.textAlign = TextAlign.center,
    this.upperCase = false,
  });

  final List<RichString>? text;
  final TextStyle? style;
  final TextAlign textAlign;
  final bool upperCase;

  @override
  Widget build(BuildContext context) => text == null
      ? const SizedBox()
      : RichText(
          text: TextSpan(
            children: text!
                .map<TextSpan>((RichString span) => TextSpan(
                      text: upperCase ? span.text.toUpperCase() : span.text,
                      style: span.bolder
                          ? AppTextStyles.bolder
                          : span.bold
                              ? AppTextStyles.bold
                              : null,
                    ))
                .toList(),
            style: style,
          ),
          textAlign: textAlign,
        );
}

class RichString {
  final String text;
  final bool bold;
  final bool bolder;

  const RichString(
    this.text, {
    this.bold = false,
    this.bolder = false,
  });
}
 */