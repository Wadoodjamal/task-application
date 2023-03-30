import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:task_application/configs/app_theme.dart';
import 'package:task_application/configs/app_typography_ext.dart';

import '../../configs/app_typography.dart';
import '../../configs/space.dart';

class CustomDropDownField extends StatefulWidget {
  final String name;
  final String header;
  final bool required;
  final List<String> items;
  final bool noUnderline;
  final Function(String?)? onChanged;
  const CustomDropDownField({
    Key? key,
    required this.name,
    required this.items,
    required this.header,
    this.required = false,
    this.noUnderline = false,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropDownField> createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.all(
        2.5,
      ),
      child: FormBuilderDropdown(
        onChanged: widget.onChanged ?? (value) {},
        icon: const Icon(Icons.keyboard_arrow_down),
        focusColor: Colors.transparent,
        decoration: InputDecoration(
            border: widget.noUnderline
                ? InputBorder.none
                : const UnderlineInputBorder()),
        selectedItemBuilder: (context) => widget.items
            .map(
              (e) => widget.required
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.header,
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          "*",
                          textAlign: TextAlign.start,
                          style: AppText.b2.cl(AppTheme.c.accent),
                        ),
                        Text(
                          ": $e",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    )
                  : Text(
                      widget.header.isEmpty ? e : "${widget.header}: $e",
                      style: const TextStyle(fontSize: 14),
                    ),
            )
            .toList(),
        initialValue: widget.items[0],
        name: widget.name,
        items: widget.items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
      ),
    );
  }
}
