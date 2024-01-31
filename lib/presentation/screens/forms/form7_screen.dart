import 'package:ecomap/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:provider/provider.dart';

class Form7Screen extends StatelessWidget {
  static const String name = 'form7_screen';

  const Form7Screen({super.key});

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
                        CustomInputText(
                          label: 'Número de Predio',
                          hintText: 'Ingrese el número del predio',
                          keyboardType: TextInputType.number,
                          controller: socioProvider.numeroRP,
                        ),
                        CustomInputText(
                          label: 'Fecha',
                          hintText: 'mm/dd/yyyy',
                          keyboardType: TextInputType.none,
                          controller: socioProvider.fechaRPController,
                          onTap: () async{
                            final response = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:DateTime(DateTime.now().year),
                              lastDate: DateTime(DateTime.now().year + 1),
                              cancelText: "Cancelar",
                              confirmText: "Guardar"
                            );
                            socioProvider.fechaRP = response == null ? 
                                null : 
                                response.toString().split(' ')[0];
                            socioProvider.fechaRPController.text = socioProvider.fechaRP ?? '';
                          },
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
                        groupValue: socioProvider.formaAP,
                        values: const ['Adjudicación', 'Compra-Venta'],
                        titles: const ['Adjudicación', 'Compra-Venta'],
                        onChanged: (value) => socioProvider.formaAP = value,
                      ),
                      CustomInputText(
                          label: 'Fecha de adquisición',
                          hintText: 'mm/dd/yyyy',
                          keyboardType: TextInputType.none,
                          controller: socioProvider.fechaAPController,
                          onTap: () async{
                            final response = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:DateTime(DateTime.now().year),
                              lastDate: DateTime(DateTime.now().year + 1),
                              cancelText: "Cancelar",
                              confirmText: "Guardar"
                            );
                            socioProvider.fechaAP = response == null ? 
                                null : 
                                response.toString().split(' ')[0];
                            socioProvider.fechaAPController.text = socioProvider.fechaAP ?? '';
                          },
                        ),
                      CustomInputText(
                        label: 'Institución que Adjudica las Tierras',
                        hintText: 'Ingrese la institución',
                        controller: socioProvider.institucionAPController,
                      ),
                      CustomInputText(
                        label: 'Observaciones',
                        hintText: 'Observaciones',
                        controller: socioProvider.observacionesAPContoller,
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
