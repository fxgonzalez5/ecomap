import 'package:flutter/material.dart';

class Head extends StatelessWidget {
  final String title;

  const Head({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Datos', style: texts.displaySmall),
        Text(title, style: texts.displaySmall!.copyWith(color: colors.primary)),
      ],
    );
  }
}