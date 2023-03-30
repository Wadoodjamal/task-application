import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:task_application/configs/app_theme.dart';

class CustomCheckBoxTile extends StatelessWidget {
  final String name;
  final String title;
  const CustomCheckBoxTile({
    Key? key,
    required this.name,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      activeColor: AppTheme.c.accent,
      name: name,
      title: Text(
        title,
      ),
      initialValue: false,
      onChanged: (value) {},
    );
  }
}
