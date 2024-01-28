import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/domain/domain.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ReportSocioBosqueDetalleScreen extends StatefulWidget {
  static const String name = 'report_socio_bosque_detalle_screen';

  ReportSocioBosqueDetalleScreen({ super.key });

  @override
  _SocioBosqueDetalleState createState() => _SocioBosqueDetalleState();
}

class _SocioBosqueDetalleState extends State<ReportSocioBosqueDetalleScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final socioProvider = context.watch<SocioBosqueProvider>();
    
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
                    onPressed: () => socioProvider.generateAndSavePDF(context, toDataTable(context, socioProvider.current!, context.read<GeneralProvider>().provincias)),
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
    final socioProvider = context.watch<SocioBosqueProvider>();
    
    final restauracion = socioProvider.current!;
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

  Map<String, String> toDataTable(BuildContext context, SocioBosque socio, Map<String, dynamic> provincias){
    return{
      'Tipo Socio': socio.tipoSocio ?? '--',
      'Tipo Capitulo': socio.tipoCapitulo ?? '',
      'Fecha': socio.fechaRegistro.toString().split(' ')[0],
      'RUC': socio.datosGenerales.ruc ?? '--',
      'Teléfono': socio.contacto.telefono ?? '--',
      'Provincia': socio.notificaciones.provincia == null ? '--' :provincias[socio.notificaciones.provincia]["provincia"],
      'Cantón': socio.notificaciones.canton == null ? '--' : provincias[socio.notificaciones.provincia]["cantones"][socio.notificaciones.canton]["canton"],
      'Parroquia': socio.notificaciones.parroquia == null ? '--' : provincias[socio.notificaciones.provincia]["cantones"][socio.notificaciones.canton]["canton"]['parroquias'][socio.notificaciones.parroquia],
      'Tipo de Cuenta Bancaria': socio.cuenta.tipo ?? '--',
      'Número de cuenta': socio.cuenta.numero ?? '--',
      'Número beneficiarios': socio.socioEconomico.beneficiarios == null ? '--' : socio.socioEconomico.beneficiarios.toString(),
      'Número de familias': socio.socioEconomico.familias == null ? '--': socio.socioEconomico.familias.toString(),
      'Ubicación del predio': socio.ubicacionPredio.latitud.toString() + ', '+socio.ubicacionPredio.longitud.toString(),
      'Hectareas a conservar': socio.ubicacionPredio.superficieConservar == null ? '--' : socio.ubicacionPredio.superficieConservar.toString(),
      'Lindero Norte': socio.linderoPredio.norte == null ? '--' : socio.linderoPredio.norte.toString(),
      'Lindero Sur': socio.linderoPredio.sur == null ? '--' : socio.linderoPredio.sur.toString(),
      'Lindero Este': socio.linderoPredio.este == null ? '--' : socio.linderoPredio.este.toString(),
      'Lindero Oeste': socio.linderoPredio.oeste == null ? '--' : socio.linderoPredio.oeste.toString(),
    };
  }
}