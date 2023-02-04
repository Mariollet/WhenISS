import 'package:keole/services/app_colors.dart';
import 'package:keole/services/app_text_styles.dart';
import "package:flutter/material.dart";

class CustomSelect extends StatefulWidget {
  final String label;
  final List<dynamic> items;
  final dynamic value;
  final String Function(dynamic) translator;
  final void Function(dynamic)? onChanged;
  final void Function(dynamic)? onSaved;

  const CustomSelect({
    super.key,
    required this.label,
    required this.items,
    required this.value,
    required this.translator,
    this.onChanged,
    this.onSaved,
  });

  @override
  CustomSelectState createState() => CustomSelectState();
}

class CustomSelectState extends State<CustomSelect> {
  @override
  Widget build(BuildContext context) => DropdownButtonFormField(
        items: widget.items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(widget.translator(item)),
                ))
            .toList(),
        value: widget.value,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        iconSize: 0,
        borderRadius: BorderRadius.circular(25),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 26,
            vertical: 20,
          ),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              widget.label.toUpperCase(),
              style: AppTextStyles.selectLabel(),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey.shade400, width: .8),
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey.shade400, width: .8),
            borderRadius: BorderRadius.circular(50),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.error, width: .8),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.error, width: .8),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      );
}
