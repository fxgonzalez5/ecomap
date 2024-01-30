import 'package:ecomap/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:provider/provider.dart';


class Form1Screen extends StatelessWidget {
  static const String name = 'form1_screen';

  const Form1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final socioProvider = context.watch<SocioBosqueProvider>();

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
                CustomDropdownButton(
                  label: 'Tipo de Socio',
                  hintText: 'Seleccione una opción',
                  options: [
                    DropdownMenuEntry(value: 'Persona Natural', label: 'Persona Natural'),
                    DropdownMenuEntry(value: 'Empresa', label: 'Empresa'),
                  ],
                  controller: socioProvider.tipoSocioController,
                ),
                CustomRadioListTile<String>(
                  label: 'Tipo de Capitulo',
                  options: [
                    RadioListTileEntry(title: 'Páramo', value: 'Páramo'),
                    RadioListTileEntry(title: 'Bosque', value: 'Bosque'),
                  ],
                  groupValue: socioProvider.tipoCapitulo,
                  onChanged: (value) => socioProvider.tipoCapitulo = value,
                ),
                Text('Datos generales', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Form(
                    child: Column(
                      children: [
                        CustomInputText(
                          label: 'Número de RUC',
                          hintText: 'Ingrese el ruc',
                          keyboardType: TextInputType.number,
                          controller: socioProvider.rucDatosGeneralesController,
                        ),
                        CustomInputText(
                          label: 'Representante Legal',
                          hintText: 'Ingrese representante',
                          controller: socioProvider.representanteDatosGeneralesControler,
                        ),
                        CustomInputText(
                          label: 'Número de Registro de la Directiva',
                          hintText: 'Ingrese el número',
                          keyboardType: TextInputType.number,
                          controller: socioProvider.registroDatosGeneralesController,
                        ),
                        CustomInputText(
                          label: 'Fecha de Persona Jurídica',
                          hintText: 'mm/dd/yyyy',
                          keyboardType: TextInputType.none,
                          controller: socioProvider.fechaPersonaJuidicaDatosGeneralesController,
                          onTap: () async{
                            final response = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:DateTime(DateTime.now().year),
                              lastDate: DateTime(DateTime.now().year + 1),
                              cancelText: "Cancelar",
                              confirmText: "Guardar"
                            );
                            socioProvider.fechaPersonaJuidicaDatosGenerales = response == null ? 
                                null : 
                                response.toString().split(' ')[0];
                            socioProvider.fechaPersonaJuidicaDatosGeneralesController.text = socioProvider.fechaPersonaJuidicaDatosGenerales ?? '';
                          },
                        ),
                        CustomInputText(
                          label: 'Etnia',
                          hintText: 'Ingrese Etnia',
                          controller: socioProvider.etniaDatosGeneralesController,
                        ),
                        CustomRadioButton(
                          label: '¿Los integrantes de la Organización viven en el predio?',
                          groupValue:  socioProvider.vivenEnElPredioDatosGenerales,
                          onChanged: (value) => socioProvider.vivenEnElPredioDatosGenerales = value,
                        ),
                        FilledButton(
                          onPressed: () => context.pushNamed(Form2Screen.name),
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

class _FormDatePicker extends StatelessWidget {
  final DateTime? date;
  final ValueChanged<DateTime> onChanged;
  
  const _FormDatePicker({
    this.date,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Fecha de Persona Jurídica', style: texts.bodyLarge),
        Padding(
          padding: EdgeInsets.only(top: responsive.hp(1.5), bottom: responsive.hp(3.5)),
          child: TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
              hintText: 'dd/mm/aaaa',
              suffixIcon: IconButton(
                icon: const Icon(Icons.edit_calendar_outlined),
                onPressed: () async {
                  var newDate = await showDatePicker(
                    context: context,
                    initialDate: date ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
          
                  // Don't change the date if the date picker returns null.
                  if (newDate == null) return;
                  onChanged(newDate);
                },
              )
            ),
          ),
        )
      ],
    );
  }
}