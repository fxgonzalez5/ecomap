import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:ecomap/presentation/screens/screens.dart';


class Form6Screen extends StatelessWidget {
  static const String name = 'form6_screen';

  const Form6Screen({super.key});

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
              title: Head(title: 'Del Predio')
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Ubicación del Predio', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Form(
                    child: Column(
                      children: [
                        const CustomInputText(
                          label: 'Coordenadas',
                          hintText: 'Latitud, Longitud',
                          isMandatory: true,
                        ),
                        const CustomInputText(
                          label: 'Superficie del Predio (Ha)',
                          hintText: 'Ingrese la superficie ',
                          keyboardType: TextInputType.number,
                          isMandatory: true,
                        ),
                        const CustomInputText(
                          label: 'Superficie a Conservar (Ha)',
                          hintText: 'Ingrese la supercia a conservar',
                          keyboardType: TextInputType.number,
                          isMandatory: true,
                        ),
                        const CustomInputText(
                          label: 'Descripción de como Llegar (opcional)',
                          hintText: 'Ingrese una breve descripción',
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