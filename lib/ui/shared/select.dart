import "package:flutter/material.dart";

class Select<E> extends StatelessWidget {
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

  final List<E> items;
  final E? value;
  final String placeholder;
  final String Function(E) labelBuilder;
  final void Function(E?)? onChanged, onSaved;
  final String? Function(E?)? validator;

  @override
  Widget build(BuildContext context) => DropdownButtonFormField(
        items: [
          for (final E item in items)
            DropdownMenuItem(
              value: item,
              child: Text(labelBuilder(item)),
            ),
        ],
        value: value,
        onChanged: onChanged,
        onSaved: onSaved,
        iconSize: 0,
        borderRadius: BorderRadius.circular(25),
        decoration: InputDecoration(labelText: placeholder),
        validator: validator,
      );
}
