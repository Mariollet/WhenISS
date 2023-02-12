import "package:flutter/material.dart";
import "package:keole/services/app_text_styles.dart";

/// A custom select menu based on the [DropdownButtonFormField] widget.
class Select<T> extends StatefulWidget {
  const Select({
    super.key,
    required this.items,
    this.value,
    required this.placeholder,
    required this.labelBuilder,
    this.onChanged,
    this.onSaved,
    this.validator,
  });

  final List<T> items;

  final T? value;

  /// The text to display when no value has been selected.
  final String placeholder;

  /// The generator for the item labels.
  final String Function(T) labelBuilder;

  final void Function(T?)? onChanged;

  final void Function(T?)? onSaved;

  final String? Function(T?)? validator;

  @override
  SelectState<T> createState() => SelectState();
}

class SelectState<T> extends State<Select<T>> {
  @override
  Widget build(BuildContext context) => DropdownButtonFormField(
        items: widget.items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(widget.labelBuilder(item)),
                ))
            .toList(),
        value: widget.value,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        iconSize: 0,
        borderRadius: BorderRadius.circular(25),
        decoration: InputDecoration(
          label: Text(widget.placeholder, style: AppTextStyles.selectLabel),
        ),
        validator: widget.validator,
      );
}
