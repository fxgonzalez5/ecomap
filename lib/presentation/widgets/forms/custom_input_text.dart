import 'package:flutter/material.dart';
import 'package:ecomap/config/theme/responsive.dart';

class CustomInputText extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isMandatory;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function()? onTap;
  final bool readOnly;

  const CustomInputText({
    super.key,
    required this.label,
    required this.hintText,
    this.isMandatory = false,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.controller,
    this.onTap,
    this.readOnly = false
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            Text(label, style: texts.bodyLarge),
            if (isMandatory)
              Text(' *', style: texts.bodyLarge!.copyWith(color: Colors.red))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: responsive.hp(1.5), bottom: responsive.hp(3.5)),
          child: TextFormField(
            autocorrect: false,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText
            ),
            onChanged: onChanged,
            validator: validator,
            controller: controller,
            onTap: onTap,
            readOnly: readOnly,
          ),
        ),
      ],
    );
  }
}