import 'package:ecomap/presentation/screens/forms/form5_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';


class Form4Screen extends StatelessWidget {
  static const String name = 'form4_screen';

  const Form4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

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
              title: Head(title: 'Socioeconómicos')
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(10)),
            sliver: SliverList.list(
              children: [
                Form(
                  child: Column(
                    children: [
                      buildCustomInputText('Número de Beneficiarios:'),
                      buildCustomInputText('Número de Familias:'),
                      buildCustomInputText('Número de Menores de Edad:'),
                      buildCustomInputText('Número de Hombres:'),
                      buildCustomInputText('Número de Mujeres:'),
                      const CustomRadioButton(label: '¿Existen Discapacitados?'),
                      buildCustomInputText('Número de Discapacitados'),
                      FilledButton(
                        onPressed: () => context.pushNamed(Form5Screen.name),
                        child: const Text('Siguiente')
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]
      )
   );
  }

  CustomInputText buildCustomInputText(String label) {
    return CustomInputText(
      label: label,
      hintText: 'Ingrese un número',
      keyboardType: TextInputType.number,
    );
  }
}