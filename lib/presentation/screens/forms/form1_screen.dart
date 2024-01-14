import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:ecomap/presentation/screens/screens.dart';


class Form1Screen extends StatelessWidget {
  static const String name = 'form1_screen';

  const Form1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

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
              title: Head(title: 'Orgnización')
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                const CustomDropdownButton(
                  label: 'Tipo de Socio',
                  hintText: 'Seleccione una opción',
                  options: [],
                ),
                CustomRadioListTile<String>(
                  label: 'Tipo de Capitulo',
                  options: [
                    RadioListTileEntry(title: 'Páramo', value: 'Páramo'),
                    RadioListTileEntry(title: 'Bosque', value: 'Bosque'),
                  ],
                  groupValue: 'Páramo',
                  onChanged: (value) {},
                ),
                Text('Datos generales', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Form(
                    child: Column(
                      children: [
                        const CustomInputText(
                          label: 'Número de RUC',
                          hintText: 'Ingrese el ruc',
                          keyboardType: TextInputType.number,
                        ),
                        const CustomInputText(
                          label: 'Representante Legal',
                          hintText: 'Ingrese representante',
                        ),
                        const CustomInputText(
                          label: 'Número de Registro de la Directiva',
                          hintText: 'Ingrese el número',
                          keyboardType: TextInputType.number,
                        ),
                        _FormDatePicker(
                          onChanged: (value) {},
                        ),
                        const CustomDropdownButton(
                          label: 'Cantón',
                          hintText: 'Seleccione cantón',
                          options: [],
                        ),
                        const CustomInputText(
                          label: 'Etnia',
                          hintText: 'Ingrese Etnia',
                        ),
                        const CustomRadioButton(label: '¿Los integrantes de la Organización viven en el predio?'),
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