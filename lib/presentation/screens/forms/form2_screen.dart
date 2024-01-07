import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:ecomap/presentation/screens/screens.dart';


class Form2Screen extends StatelessWidget {
  static const String name = 'form2_screen';

  const Form2Screen({super.key});

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
                Text('Notificaciones', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Form(
                    child: Column(
                      children: [
                        const CustomInputText(
                          label: 'Dirección',
                          hintText: 'Ingrese dirección',
                        ),
                        const CustomDropdownButton(
                          label: 'Provincia',
                          hintText: 'Seleccione provincia',
                          options: [],
                        ),
                        const CustomDropdownButton(
                          label: 'Cantón',
                          hintText: 'Seleccione cantón',
                          options: [],
                        ),
                        const CustomDropdownButton(
                          label: 'Parroquia',
                          hintText: 'Seleccione parroquia',
                          options: [],
                        ),
                        const CustomInputText(
                          label: 'Comunidad',
                          hintText: 'Ingrese la comunidad',
                        ),
                        const CustomInputText(
                          label: 'Teléfono Convencional',
                          hintText: 'Ingrese número de teléfono',
                          keyboardType: TextInputType.number,
                        ),
                        const CustomInputText(
                          label: 'Teléfono Celular',
                          hintText: 'Ingrese número celular',
                          keyboardType: TextInputType.number,
                        ),
                        const CustomInputText(
                          label: 'Correo Electrónico',
                          hintText: 'Ingrese correo',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        FilledButton(
                          onPressed: () => context.pushNamed(Form3Screen.name),
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