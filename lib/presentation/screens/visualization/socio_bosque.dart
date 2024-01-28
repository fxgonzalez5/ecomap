
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/widgets/visualization/socio_bosque_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VisualizationSocioBosqueScreen extends StatefulWidget {
  static const String name = 'visualization_socio_bosque_screen';

  VisualizationSocioBosqueScreen({ super.key });

  @override
  _SocioBosqueState createState() => _SocioBosqueState();
}

class _SocioBosqueState extends State<VisualizationSocioBosqueScreen> {
  @override
  Widget build(BuildContext context) {
    final socioProvider = context.watch<SocioBosqueProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: SocioBosqueList(
        onTap: (x) => socioProvider.navigateToEdit(context, x),
      )
    );
  }
}