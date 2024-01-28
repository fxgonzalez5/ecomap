
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/widgets/visualization/socio_bosque_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ReportSocioBosqueScreen extends StatelessWidget {
  static const String name = 'report_socio_bosque_screen';

  ReportSocioBosqueScreen({ super.key });

  @override
  Widget build(BuildContext context){
    final socioProvider = context.watch<SocioBosqueProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: SocioBosqueList(
        onTap: (x) => socioProvider.navigateToReportDetalle(context, x),
      ),
    );
  }
}