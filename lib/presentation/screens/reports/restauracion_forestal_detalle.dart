import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/domain/domain.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/widgets/forms/head.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportRestauracionForestalDetalleScreen extends StatefulWidget {
  static const String name = 'report_restauracion_forestal_detalle_screen';
  
  const ReportRestauracionForestalDetalleScreen({ Key? key }) : super(key: key);

  @override
  _RestauracionForestalDetalleState createState() => _RestauracionForestalDetalleState();
}

class _RestauracionForestalDetalleState extends State<ReportRestauracionForestalDetalleScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final restauracionProvider = context.watch<RestauracionForestalProvider>();
    
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
                    onPressed: () => restauracionProvider.generateAndSavePDF(context, toDataTable(context, restauracionProvider.currentRestauracionForestal!, context.read<GeneralProvider>().provincias)),
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
            ),
          ),
        ],
      ),
    );
  }

  buildRows(BuildContext context){
    final texts = Theme.of(context).textTheme;
    final restauracionProvider = context.watch<RestauracionForestalProvider>();
    
    final restauracion = restauracionProvider.currentRestauracionForestal!;
    final data = toDataTable(context, restauracion, context.watch<GeneralProvider>().provincias);

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

  Map<String, String> toDataTable(BuildContext context, RestauracionForestal restauracion, Map<String, dynamic> provincias){
    return{
      'Fecha': restauracion.fechaRegistro.toString().split(' ')[0],
      'Código Ficha': restauracion.beneficiario.codigoFicha ?? '--',
      'Cédula': restauracion.beneficiario.cedula ?? '--',
      'Beneficiario': restauracion.beneficiario.nombre ?? '--',
      'Fecha lanzamiento': restauracion.detalle.fechaLanzamiento == null ? '--' : restauracion.detalle.fechaLanzamiento.toString().split(' ')[0],
      'Equipo GPS': restauracion.detalle.equipoGPS ?? '--',
      'Provincia': restauracion.ubicacion.provincia == null ? '--' :provincias[restauracion.ubicacion.provincia]["provincia"],
      'Cantón': restauracion.ubicacion.canton == null ? '--' : provincias[restauracion.ubicacion.provincia]["cantones"][restauracion.ubicacion.canton]["canton"],
      'Parroquia': restauracion.ubicacion.parroquia == null ? '--' : provincias[restauracion.ubicacion.provincia]["cantones"][restauracion.ubicacion.canton]["canton"]['parroquias'][restauracion.ubicacion.parroquia],
      'Latitud': restauracion.ubicacion.latitud == null ? '--' : restauracion.ubicacion.latitud.toString(),
      'Longitud': restauracion.ubicacion.longitud == null ? '--' : restauracion.ubicacion.longitud.toString(),
      'Observaciones': restauracion.ubicacion.observaciones ?? '--',
      'Número de viveros': restauracion.potenciacion.cantidad == null ? '--' : restauracion.potenciacion.cantidad.toString(),
      'Actividades': restauracion.potenciacion.actividades ?? '--'
    };
  }
}