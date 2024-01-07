import 'package:flutter/material.dart';
import 'package:ecomap/config/theme/responsive.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final String label;
  final String hintText;
  final List<DropdownMenuEntry<T>> options;
  final ValueChanged<T?>? onSelected;

  const CustomDropdownButton({
    super.key,
    required this.label,
    required this.hintText, 
    required this.options,
    this.onSelected
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: texts.bodyLarge),
        Padding(
          padding: EdgeInsets.only(top: responsive.hp(1.5), bottom: responsive.hp(3.5)),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return DropdownMenu(
                width: constraints.maxWidth,
                hintText: hintText,
                dropdownMenuEntries: options,
                onSelected: onSelected,
              );
            },
          ),
        ),
      ],
    );
  }
}