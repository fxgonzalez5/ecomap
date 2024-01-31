import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/providers/control_forestal.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FormControlForestalPropietarioScreen extends StatefulWidget {
  static const String name = 'form_control_forestal_propietario_screen';
  const FormControlForestalPropietarioScreen({ super.key });

  @override
  State<FormControlForestalPropietarioScreen> createState() => _PropietarioState();
}

class _PropietarioState extends State<FormControlForestalPropietarioScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final controlProvider = context.watch<ControlForestalProvider>();
    final generalProvider = context.watch<GeneralProvider>();
    if(controlProvider.current == null){
      controlProvider.getLocation();
    }

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
              title: Head(title: 'Propietario'),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Contacto del dueño del predio', style: texts.titleLarge),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInputText(
                          label: 'Dueño del predio',
                          hintText: 'Ingrese el nombre',
                          keyboardType: TextInputType.text,
                          controller: controlProvider.nombrePropietarioController,
                        ),
                        CustomDropdownButton(
                          label: 'Provincia',
                          hintText: 'Seleccione una provincia',
                          controller: controlProvider.provinciaController,
                          options: generalProvider
                            .getProvincias()
                            .map((x) => DropdownMenuEntry(value: x['value'], label: x['label'] as String))
                            .toList(),
                          onSelected: (value){
                            controlProvider.provincia = value;
                            controlProvider.canton = null;
                            controlProvider.parroquia = null;
                            controlProvider.cantonController.clear();
                            controlProvider.parroquiaController.clear();
                          },
                          initialSelection: controlProvider.provincia,
                        ),
                        CustomDropdownButton(
                          label: 'Cantón',
                          hintText: 'Seleccione una cantón',
                          controller: controlProvider.cantonController,
                          options:generalProvider
                            .getCantones(controlProvider.provincia)
                            .map((x) => DropdownMenuEntry(value: x['value'], label: x['label'] as String))
                            .toList(),
                          onSelected: (value){
                            controlProvider.canton = value;
                            controlProvider.parroquia = null;
                            controlProvider.parroquiaController.clear();
                          },
                          initialSelection: controlProvider.canton,
                        ),
                        CustomDropdownButton(
                          label: 'Parroquia',
                          hintText: 'Seleccione una parroquia',
                          controller: controlProvider.parroquiaController,
                          options: generalProvider
                            .getParroquias(controlProvider.provincia, controlProvider.canton)
                            .map((x) => DropdownMenuEntry(value: x['value'], label: x['label'] as String))
                            .toList(),
                          onSelected: (value){
                            controlProvider.parroquia = value;
                          },
                          initialSelection: controlProvider.parroquia,
                        ),
                        CustomInputText(
                          label: 'Ubicación actual',
                          hintText: '',
                          keyboardType: TextInputType.none,
                          controller: controlProvider.coordenadasController,
                          readOnly: true,
                        ),
                        CustomInputText(
                          label: 'Teléfono convencional',
                          hintText: 'Ingrese el número de teléfono',
                          keyboardType: TextInputType.phone,
                          controller: controlProvider.convencionalController,
                        ),
                        CustomInputText(
                          label: 'Teléfono celular',
                          hintText: 'Ingrese el número de celular',
                          keyboardType: TextInputType.phone,
                          controller: controlProvider.celularController,
                        ),
                        CustomInputText(
                          label: 'Correo electrónico',
                          hintText: 'Ingrese el email',
                          keyboardType: TextInputType.emailAddress,
                          controller: controlProvider.emailController,
                        ),
                        FilledButton(
                          onPressed: () => context.pushNamed(FormControlForestaLineaScreen.name),
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