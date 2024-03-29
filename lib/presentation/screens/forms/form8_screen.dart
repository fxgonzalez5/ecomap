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
                Text('Gravamen', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Column(
                    children: [
                      CustomRadioButton(
                        label: '¿El predio posee gravamen?',
                        groupValue: socioProvider.poseeGravamen,
                        onChanged: (value) => socioProvider.poseeGravamen = value,    
                      ),
                      CustomInputText(
                        label: 'Tipo de gravamen',
                        hintText: 'Ingrese tipo de gravamen',
                        controller: socioProvider.tipoGravamenController,
                      ),
                      CustomInputText(
                        label: 'Institución gravamen',
                        hintText: 'Ingrese institución gravamen',
                        controller: socioProvider.institucionGravamenController,
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
                      CustomRadioButton(
                        label: '¿El predio posee hipotecas?',
                        groupValue: socioProvider.hipotecaGravamen,
                        onChanged: (value) => socioProvider.hipotecaGravamen = value,  
                      ),
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