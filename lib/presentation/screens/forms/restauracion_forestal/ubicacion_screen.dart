import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class FormRestauracionForestalUbicacionScreen extends StatefulWidget {
  static const String name = 'form_restauracion_forestal_ubicacion_screen';
  const FormRestauracionForestalUbicacionScreen({ super.key });

  @override
  _UbicacionScreenState createState() => _UbicacionScreenState();
}

class _UbicacionScreenState extends State<FormRestauracionForestalUbicacionScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final restauracionProvider = context.watch<RestauracionForestalProvider>();
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
              title: Head(title: 'Ubicación'),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Datos ubicación', style: texts.titleLarge),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropdownButton(
                          label: 'Provincia',
                          hintText: 'Seleccione una provincia',
                          controller: restauracionProvider.provinciaController,
                          options: generalProvider
                            .getProvincias()
                            .map((x) => DropdownMenuEntry(value: x['value'], label: x['label'] as String))
                            .toList(),
                          onSelected: (value){
                            restauracionProvider.provincia = value;
                            restauracionProvider.canton = null;
                            restauracionProvider.parroquia = null;
                            restauracionProvider.cantonController.clear();
                            restauracionProvider.parroquiaController.clear();
                          },
                          initialSelection: restauracionProvider.provincia,
                        ),
                        CustomDropdownButton(
                          label: 'Cantón',
                          hintText: 'Seleccione una cantón',
                          controller: restauracionProvider.cantonController,
                          options:generalProvider
                            .getCantones(restauracionProvider.provincia)
                            .map((x) => DropdownMenuEntry(value: x['value'], label: x['label'] as String))
                            .toList(),
                          onSelected: (value){
                            restauracionProvider.canton = value;
                            restauracionProvider.parroquia = null;
                            restauracionProvider.parroquiaController.clear();
                          },
                          initialSelection: restauracionProvider.canton,
                        ),
                        CustomDropdownButton(
                          label: 'Parroquia',
                          hintText: 'Seleccione una parroquia',
                          controller: restauracionProvider.parroquiaController,
                          options: generalProvider
                            .getParroquias(restauracionProvider.provincia, restauracionProvider.canton)
                            .map((x) => DropdownMenuEntry(value: x['value'], label: x['label'] as String))
                            .toList(),
                          onSelected: (value){
                            restauracionProvider.parroquia = value;
                          },
                          initialSelection: restauracionProvider.parroquia,
                        ),
                        CustomInputText(
                          label: 'Observaciones',
                          hintText: 'Ingrese las observaciones',
                          keyboardType: TextInputType.text,
                          controller: restauracionProvider.observacionesController,
                        ),
                        FilledButton(
                          onPressed: () => context.pushNamed(FormRestauracionForestalPotenciacionScreen.name),
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