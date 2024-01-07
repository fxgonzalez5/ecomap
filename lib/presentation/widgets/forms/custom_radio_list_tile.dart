import 'package:flutter/material.dart';
import 'package:ecomap/config/theme/responsive.dart';

class RadioListTileEntry<T> {
  final String title;
  final T value;

  RadioListTileEntry({required this.title, required this.value});
}

class CustomRadioListTile<T> extends StatelessWidget {
  final String label;
  final List<RadioListTileEntry<T>> options;
  final T groupValue;
  final ValueChanged<T?> onChanged;

  const CustomRadioListTile({
    super.key,
    required this.label,
    required this.options,
    required this.groupValue,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: texts.bodyLarge),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: responsive.hp(1), bottom: responsive.hp(2.5)),
          itemCount: options.length,
          itemBuilder: (BuildContext context, int index) {
            return RadioListTile(
              title: Text(options[index].title, style: texts.bodyLarge),
              value: options[index].value,
              groupValue: groupValue,
              onChanged: onChanged,
            );
          },
        ),
      ],
    );
  }
}