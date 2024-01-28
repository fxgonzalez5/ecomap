
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:ecomap/presentation/widgets/forms/custom_input_text.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class VisualizationRestauracionForestalScreen extends StatefulWidget {
  static const String name = 'visualization_restauracion_forestal_screen';

  const VisualizationRestauracionForestalScreen({ super.key });

  @override
  _RestauracionForestalState createState() => _RestauracionForestalState();
}

class _RestauracionForestalState extends State<VisualizationRestauracionForestalScreen> {
    
  
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final restauracionProvider = context.watch<RestauracionForestalProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: RestauracionForestalList(
        onTap: (x) => restauracionProvider.navigateToEdit(context, x),
      )
    );
  }
  
}