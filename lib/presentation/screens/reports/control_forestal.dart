
import 'package:ecomap/presentation/providers/control_forestal.dart';
import 'package:ecomap/presentation/widgets/visualization/control_forestal_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportControlForestalScreen extends StatelessWidget {
  static const String name = 'report_control_forestal_screen';

  const ReportControlForestalScreen({ super.key });

  @override
  Widget build(BuildContext context){
    final controlProvider = context.watch<ControlForestalProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: ControlForestalList(
        onTap: (x) => controlProvider.navigateToReportDetalle(context, x),
      ),
    );
  }
}