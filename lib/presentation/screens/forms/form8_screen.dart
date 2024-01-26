import 'package:ecomap/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:provider/provider.dart';

class Form8Screen extends StatelessWidget {
  static const String name = 'form8_screen';

  const Form8Screen({super.key});

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
                title: Head(title: 'Del Predio')),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Escritura del predio', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: const Column(
                    children: [
                      CustomDropdownButton(
                        label: 'Provincia',
                        hintText: 'Seleccione Provincia',
                        options: [],
                      ),
                      CustomDropdownButton(
                        label: 'Cantón',
                        hintText: 'Seleccione Cantón',
                        options: [],
                      ),
                      CustomDropdownButton(
                        label: 'Parroquia',
                        hintText: 'Seleccione Parroquia',
                        options: [],
                      ),
                    ],
                  ),
                ),
                Text('Gravamen', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: const Column(
                    children: [
                      CustomRadioButton(label: '¿El predio posee gravamen?'),
                      CustomInputText(
                        label: 'Tipo de gravamen',
                        hintText: 'Ingrese tipo de gravamen',
                        keyboardType: TextInputType.number,
                      ),
                      CustomInputText(
                        label: 'Institución gravamen',
                        hintText: 'Ingrese institución gravamen',
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                Text('Hipotecas', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Column(
                    children: [
                      const CustomRadioButton(label: '¿El predio posee hipotecas?'),
                      FilledButton(
                        onPressed: () => context.pushNamed(Form9Screen.name),
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