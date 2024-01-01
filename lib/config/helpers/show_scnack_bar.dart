import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {

  ScaffoldMessenger.of(context).clearSnackBars();

  final snakback = SnackBar(
    content: Text(message),
  );

  ScaffoldMessenger.of(context).showSnackBar(snakback);

}