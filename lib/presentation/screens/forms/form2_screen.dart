import 'package:ecomap/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:provider/provider.dart';


class Form2Screen extends StatelessWidget {
  static const String name = 'form2_screen';

  const Form2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final socioProvider = context.watch<SocioBosqueProvider>();
    final generalProvider = context.watch<GeneralProvider>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: responsive.hp(10),
            expandedHeight: responsive.hp(12),
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              expandedTitleScale: 1,
              titlePadding: EdgeInsets.zero,
              title: Head(title: 'Organización')
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Notificaciones', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Form(
                    child: Column(
                      children: [
                        CustomInputText(
                          label: 'Dirección',
                          hintText: 'Ingrese dirección',
                          controller: socioProvider.direccionNotificacionController,
                        ),
                        CustomDropdownButton(
                          label: 'Provincia',
                          hintText: 'Seleccione provincia',
                          controller: socioProvider.provinciaNotificacionController,
                          options: generalProvider
                            .getProvincias()
                            .map((x) => DropdownMenuEntry(value: x['value'], label: x['label'] as String))
                            .toList(),
                          onSelected: (value){
                            socioProvider.provincia = value;
                            socioProvider.canton = null;
                            socioProvider.parroquia = null;
                            socioProvider.cantonNotificacionController.clear();
                            socioProvider.parroquiaNotificacionController.clear();
                          },
                          initialSelection: socioProvider.provincia,
                        ),
                        CustomDropdownButton(
                          label: 'Cantón',
                          hintText: 'Seleccione cantón',
                          controller: socioProvider.cantonNotificacionController,
                          options:generalProvider
                            .getCantones(socioProvider.provincia)
                            .map((x) => DropdownMenuEntry(value: x['value'], label: x['label'] as String))
                            .toList(),
                          onSelected: (value){
                            socioProvider.canton = value;
                            socioProvider.parroquia = null;
                            socioProvider.parroquiaNotificacionController.clear();
                          },
                          initialSelection: socioProvider.canton,
                        ),
                        CustomDropdownButton(
                          label: 'Parroquia',
                          hintText: 'Seleccione parroquia',
                          controller: socioProvider.parroquiaNotificacionController,
                          options: generalProvider
                            .getParroquias(socioProvider.provincia, socioProvider.canton)
                            .map((x) => DropdownMenuEntry(value: x['value'], label: x['label'] as String))
                            .toList(),
                          onSelected: (value){
                            socioProvider.parroquia = value;
                          },
                          initialSelection: socioProvider.parroquia,
                        ),
                        CustomInputText(
                          label: 'Comunidad',
                          hintText: 'Ingrese la comunidad',
                          controller: socioProvider.comunidadNotificacionController,
                        ),
                        CustomInputText(
                          label: 'Teléfono Convencional',
                          hintText: 'Ingrese número de teléfono',
                          keyboardType: TextInputType.number,
                          controller: socioProvider.convencionalNotificacionController,
                        ),
                        CustomInputText(
                          label: 'Teléfono Celular',
                          hintText: 'Ingrese número celular',
                          keyboardType: TextInputType.number,
                          controller: socioProvider.celularNotificacionController,
                        ),
                        CustomInputText(
                          label: 'Correo Electrónico',
                          hintText: 'Ingrese correo',
                          keyboardType: TextInputType.emailAddress,
                          controller: socioProvider.emailNotificacionController,
                        ),
                        FilledButton(
                          onPressed: () => context.pushNamed(Form3Screen.name),
                          child: const Text('Siguiente')
                        )
                      ],
                    ),
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
   );
  }
}