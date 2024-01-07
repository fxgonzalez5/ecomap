import 'package:flutter/material.dart';
import 'package:ecomap/config/theme/responsive.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final IconData prefixIcon;
  final String hintText;
  final bool isNotVisible;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  

  const CustomTextFormField({
    super.key, 
    this.keyboardType,
    required this.prefixIcon,
    required this.hintText,
    this.isNotVisible = false,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return TextFormField(
      autocorrect: false,
      keyboardType: keyboardType,
      obscureText: isNotVisible,
      style: TextStyle(fontSize: responsive.ip(1.8)),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: responsive.hp(1.75)),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(3.5)),
          child: Icon(prefixIcon, size: responsive.ip(3)),
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: responsive.ip(1.8), color: Colors.grey, fontWeight: FontWeight.normal)
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}