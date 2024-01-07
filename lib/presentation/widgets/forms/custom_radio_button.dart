import 'package:flutter/material.dart';
import 'package:ecomap/config/theme/responsive.dart';

class CustomRadioButton<T> extends StatelessWidget {
  final String label;
  final List<T>? values;
  final T? groupValue;
  final List<String> titles;
  final ValueChanged<T>? onChanged;

  const CustomRadioButton({
    super.key,
    required this.label,
    this.values,
    this.groupValue,
    this.titles = const ['Si', 'No'],
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: texts.bodyLarge),
        SizedBox(height: responsive.hp(1)),
        Row(
          children: [
            Radio(
              value: values?.first ?? true,
              groupValue: groupValue ?? true,
              onChanged: (value) {
                if (onChanged != null) {
                  onChanged!(value as T);
                } else {
                  
                }
              },
            ),
            Text(titles[0], style: texts.bodyLarge),
            SizedBox(width: responsive.wp(5)),
            Radio(
              value: values?.last ?? false,
              groupValue: groupValue ?? true,
              onChanged: (value) {
                if (onChanged != null) {
                  onChanged!(value as T);
                } else {
                  
                }
              }
            ),
            Text(titles[1], style: texts.bodyLarge),
          ],
        ),
        SizedBox(height: responsive.hp(3.5)),
      ],
    );
  }
}
