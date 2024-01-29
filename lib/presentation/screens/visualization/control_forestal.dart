import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/providers/control_forestal.dart';
import 'package:ecomap/presentation/widgets/visualization/control_forestal_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VisualizationControlForestalScreen extends StatelessWidget {
  static const String name = 'visualization_control_forestal_screen';
  
  VisualizationControlForestalScreen({ super.key });

  @override
  Widget build(BuildContext context){
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final controlProvider = context.watch<ControlForestalProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: ControlForestalList(
        onTap: (x) => controlProvider.navigateToEdit(context, x),
      )
    );
  }
}