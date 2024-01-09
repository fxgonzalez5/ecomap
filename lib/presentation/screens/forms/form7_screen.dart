import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:ecomap/presentation/screens/screens.dart';

class Form7Screen extends StatelessWidget {
  static const String name = 'form7_screen';

  const Form7Screen({super.key});

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
                title: Head(title: 'Del Predio')),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Inscripción en el Registro de la Propiedad', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Form(
                    child: Column(
                      children: [
                        const CustomInputText(
                          isMandatory: true,
                          label: 'Número de Predio',
                          hintText: 'Ingrese el número del predio',
                          keyboardType: TextInputType.number,
                        ),
                        _FormDatePicker(
                          title: 'Fecha',
                          onChanged: (value) {},
                        ),
                        const CustomDropdownButton(
                          label: 'Provincia',
                          hintText: 'Seleccione Provincia',
                          options: [],
                        ),
                        const CustomDropdownButton(
                          label: 'Cantón',
                          hintText: 'Seleccione Cantón',
                          options: [],
                        ),
                        const CustomDropdownButton(
                          label: 'Parroquia',
                          hintText: 'Seleccione Parroquia',
                          options: [],
                        ),
                      ],
                    ),
                  ),
                ),
                Text('Adquisición del Predio', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Column(
                    children: [
                      CustomRadioButton(
                        label: 'Forma de Adquisición',
                        groupValue: 'Adjudicación',
                        values: const ['Adjudicación', 'Compra-Venta'],
                        titles: const ['Adjudicación', 'Compra-Venta'],
                        onChanged: (value) {},
                      ),
                      _FormDatePicker(
                        title: 'Fecha de Adquisión',
                        onChanged: (value) {},
                      ),
                      const CustomDropdownButton(
                        label: 'Institución que Adjudica las Tierras',
                        hintText: 'Seleccione institución',
                        options: [],
                      ),
                      const CustomInputText(
                        label: 'Observaciones sobre la adquisición del predio',
                        hintText: 'Observaciones',
                        keyboardType: TextInputType.number,
                      ),
                      FilledButton(
                        onPressed: () => context.pushNamed(Form8Screen.name),
                        child: const Text('Siguiente'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FormDatePicker extends StatelessWidget {
  final String title;
  final DateTime? date;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    this.title = 'Fecha',
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
        Text(title, style: texts.bodyLarge),
        Padding(
          padding: EdgeInsets.only(
              top: responsive.hp(1.5), bottom: responsive.hp(3.5)),
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
                )),
          ),
        )
      ],
    );
  }
}
