import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/widgets/visualization/restauracion_forestal_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportRestauracionForestalScreen extends StatefulWidget {
  static const String name = 'report_restauracion_forestal_screen';

  const ReportRestauracionForestalScreen({ super.key });

  @override
  State<ReportRestauracionForestalScreen> createState() => _RestauracionForestalState();
}

class _RestauracionForestalState extends State<ReportRestauracionForestalScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<RestauracionForestalProvider>(context, listen: false).getAll();
  }
  
  
  @override
  Widget build(BuildContext context) {
    final restauracionProvider = context.watch<RestauracionForestalProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: RestauracionForestalList(
        onTap: (x) => restauracionProvider.navigateToReportDetalle(context, x)
      )
    );
  }
}