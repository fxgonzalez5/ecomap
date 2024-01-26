import 'package:ecomap/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:provider/provider.dart';


class Form6Screen extends StatelessWidget {
  static const String name = 'form6_screen';

  const Form6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final socioProvider = context.watch<SocioBosqueProvider>();

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
              title: Head(title: 'Del Predio')
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(2)),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ubicación del Predio', style: texts.titleLarge),
                        SizedBox(height: 10,),
                        CustomInputText(
                          label: 'Superficie del Predio (Ha)',
                          hintText: 'Ingrese la superficie ',
                          keyboardType: TextInputType.number,
                          controller: socioProvider.superficieUbicacion,
                        ),
                        CustomInputText(
                          label: 'Superficie a Conservar (Ha)',
                          hintText: 'Ingrese la supercia a conservar',
                          keyboardType: TextInputType.number,
                          controller: socioProvider.superficieConservarUbicacion,
                        ),
                        CustomInputText(
                          label: 'Descripción de como Llegar (opcional)',
                          hintText: 'Ingrese una breve descripción',
                          controller: socioProvider.descripcionUbicacion,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text('Linderos del predio', style: texts.titleLarge),
                        ),
                        CustomInputText(
                          label: 'Norte',
                          hintText: 'Ingrese el lindero del Norte',
                          controller: socioProvider.norteLindero,
                        ),
                        CustomInputText(
                          label: 'Sur',
                          hintText: 'Ingrese el lindero del Sur',
                          controller: socioProvider.surLindero,
                        ),
                        CustomInputText(
                          label: 'Este',
                          hintText: 'Ingrese el lindero del Este',
                          controller: socioProvider.esteLindero,
                        ),
                        CustomInputText(
                          label: 'Oeste',
                          hintText: 'Ingrese el lindero del Oeste',
                          controller: socioProvider.oesteLindero,
                        ),
                        FilledButton(
                          onPressed: () => context.pushNamed(Form7Screen.name),
                          child: const Text('Siguiente')
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
   );
  }
}