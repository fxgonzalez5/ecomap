import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/providers/control_forestal.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/screens/forms/control_forestal/poblacion_screen.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FormControlForestaLineaScreen extends StatefulWidget {
  static const String name = 'form_control_forestal_linea_screen';
  const FormControlForestaLineaScreen({ super.key });

  @override
  _PropietarioState createState() => _PropietarioState();
}

class _PropietarioState extends State<FormControlForestaLineaScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final controlProvider = context.watch<ControlForestalProvider>();
    final generalProvider = context.watch<GeneralProvider>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: responsive.hp(8),
            expandedHeight: responsive.hp(12),
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              expandedTitleScale: 1,
              titlePadding: EdgeInsets.zero,
              title: Head(title: 'Línea Base'),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Información relevante', style: texts.titleLarge),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInputText(
                          label: 'Volumen de madera revisada (m3)',
                          hintText: 'Ingrese el volumen en metros cúbicos',
                          keyboardType: TextInputType.number,
                          controller: controlProvider.volumenMaderaRevisadaController,
                        ),
                        CustomInputText(
                          label: 'Volumen de madera retenida (m3)',
                          hintText: 'Ingrese el volumen en metros cúbicos',
                          keyboardType: TextInputType.number,
                          controller: controlProvider.volumenMaderaRetenidaController,
                        ),
                        CustomInputText(
                          label: 'Retención de especímenes de vida silvestre',
                          hintText: 'Ingrese el número de especímenes',
                          keyboardType: TextInputType.number,
                          controller: controlProvider.retencionEspecimenesController,
                        ),
                        CustomInputText(
                          label: 'Superficie de incendios forestales (ha)',
                          hintText: 'Ingrese superficie de incendios',
                          keyboardType: TextInputType.number,
                          controller: controlProvider.superficieIncendiosController,
                        ),
                        CustomInputText(
                          label: 'Programas de manejo forestal auditados',
                          hintText: 'Ingrese el número de programa auditados',
                          keyboardType: TextInputType.number,
                          controller: controlProvider.programasController,
                        ),
                        FilledButton(
                          onPressed: () => context.pushNamed(FormControlForestaPoblacionScreen.name),
                          child: const Text('Siguiente')
                        )
                      ]
                    )
                  )
                )
              ]
            )
          )
        ],
      ),
    );
  }
}