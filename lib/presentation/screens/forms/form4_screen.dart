import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/screens/forms/form5_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class Form4Screen extends StatelessWidget {
  static const String name = 'form4_screen';

  const Form4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
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
                      buildCustomInputText('Número de Beneficiarios:', socioProvider.beneficiariosSEController),
                      buildCustomInputText('Número de Familias:', socioProvider.familiasSEController),
                      buildCustomInputText('Número de Menores de Edad:', socioProvider.menoresSEController),
                      buildCustomInputText('Número de Hombres:', socioProvider.hombresSEController),
                      buildCustomInputText('Número de Mujeres:', socioProvider.mujeresSEController),
                      CustomRadioButton(
                        label: '¿Existen Discapacitados?',
                        groupValue: socioProvider.discapacitadosSE,
                        onChanged: (value) => socioProvider.discapacitadosSE = value,
                      ),
                      buildCustomInputText('Número de Discapacitados', socioProvider.cantidadDiscapacitadosSEController),
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

  CustomInputText buildCustomInputText(String label, TextEditingController controller) {
    return CustomInputText(
      label: label,
      hintText: 'Ingrese un número',
      keyboardType: TextInputType.number,
      controller: controller,
    );
  }
}