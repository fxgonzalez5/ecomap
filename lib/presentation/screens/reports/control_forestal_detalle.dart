import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/domain/domain.dart';
import 'package:ecomap/presentation/providers/control_forestal.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportControlForestalDetalleScreen extends StatefulWidget {
  static const String name = 'report_control_forestal_detalle_screen';

  const ReportControlForestalDetalleScreen({ Key? key }) : super(key: key);

  @override
  _ControlForestalDetalleState createState() => _ControlForestalDetalleState();
}

class _ControlForestalDetalleState extends State<ReportControlForestalDetalleScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final controlProvider = context.watch<ControlForestalProvider>();
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: responsive.hp(8),
            expandedHeight: responsive.hp(15),
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              expandedTitleScale: 1,
              titlePadding: EdgeInsets.zero,
              title: Head(titleMain: 'Resumen y',title: 'Reportes')
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Table(
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1),
                        ),  
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Nombre',
                              style: texts.titleMedium,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Detalle',
                              style: texts.titleMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...buildRows(context)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0, right: 8, bottom: 8, top: 20),
                  child: FilledButton(
                    onPressed: () => controlProvider.generateAndSavePDF(context, toDataTable(context, controlProvider.current!, context.read<GeneralProvider>().provincias)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Generar '),
                        Icon(Icons.picture_as_pdf)
                      ],
                    )
                  ),
                )
              ]
            )
          )
        ],
      ),
    );
  }


  buildRows(BuildContext context){
    final texts = Theme.of(context).textTheme;
    final controlProvider = context.watch<ControlForestalProvider>();
    
    final control = controlProvider.current!;
    final data = toDataTable(context, control, context.watch<GeneralProvider>().provincias);

    return data.keys.map((x) => TableRow(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 0.5),
        ),  
      ),
      children: [
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(x),
          ),
        ),
        TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(data[x].toString()),
          ),
        ),
      ],
    ),).toList(); 
  }

  Map<String, String> toDataTable(BuildContext context, ControlForestal control, Map<String, dynamic> provincias){
    return{
      'Fecha': control.fechaRegistro.toString().split(' ')[0],
      'Dueño del predio': control.datosPropietario.nombre ?? '--',
      'Provincia': control.datosPropietario.provincia == null ? '--' :provincias[control.datosPropietario.provincia]["provincia"],
      'Cantón': control.datosPropietario.canton == null ? '--' : provincias[control.datosPropietario.provincia]["cantones"][control.datosPropietario.canton]["canton"],
      'Parroquia': control.datosPropietario.parroquia == null ? '--' : provincias[control.datosPropietario.provincia]["cantones"][control.datosPropietario.canton]["canton"]['parroquias'][control.datosPropietario.parroquia],
      'Teléfono/cel': control.datosPropietario.celular ?? '--',
      'Correo': control.datosPropietario.email ?? '--',
      'Madera revisada':(control.lineaBase.volumenMaderaRevisada == null ? '--' : control.lineaBase.volumenMaderaRevisada.toString() )+ ' m^3',
      'Madera retenida':(control.lineaBase.volumenMaderaRetenida == null ? '--' : control.lineaBase.volumenMaderaRetenida.toString() )+ ' m^3',
      'Num Especímenes': control.lineaBase.retencionEspecimenes == null ? '--' : control.lineaBase.retencionEspecimenes.toString(),
      'Superficie incendios': (control.lineaBase.superficieIncendios == null ? '--' : control.lineaBase.superficieIncendios.toString()) + ' Ha',
      'Ejecutores': control.poblacion.ejecutores == null ? '--' : control.poblacion.ejecutores.toString(),
      'Transportistas': control.poblacion.transportistasMadera == null ? '--' : control.poblacion.transportistasMadera.toString(),
    };
  }
}