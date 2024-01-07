import 'package:flutter/material.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';


class Form5Screen extends StatelessWidget {
  static const String name = 'form5_screen';

  const Form5Screen({super.key});

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
              title: Head(title: 'Socioeconómicos')
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Principales actividades económicas ', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Form(
                    child: Column(
                      children: [
                        const CustomInputText(
                          label: 'Nombre actvidad',
                          hintText: 'Ingrese nombre',
                        ),
                        const CustomInputText(
                          label: 'Descripción',
                          hintText: 'Ingrese una breve descripción',
                        ),
                        FilledButton.tonal(
                          style: ButtonStyle(
                            fixedSize: const MaterialStatePropertyAll(Size.infinite),
                            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: responsive.wp(10)))
                          ),
                          onPressed: () {},
                          child: const Text('Agregar')
                        ),
                        SizedBox(height: responsive.hp(3.5)),
                        const CustomInputText(
                          label: 'Valor promedio de ingresos Familiares (\$/mes)',
                          hintText: 'Ingrese un monto',
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ),
                Text('Principales actividades económicas ', style: texts.titleLarge),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Column(
                    children: [
                      Container(
                        height: responsive.hp(24),
                        margin: EdgeInsets.only(top: responsive.hp(1.5), bottom: responsive.hp(3.5)),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Text('Actividad $index', style: texts.bodyLarge,),
                                const Spacer(),
                                FilledButton.tonal(
                                  style: const ButtonStyle(
                                    fixedSize: MaterialStatePropertyAll(Size.infinite),
                                    textStyle: MaterialStatePropertyAll(TextStyle(fontWeight: FontWeight.bold))
                                  ),
                                  onPressed: () {},
                                  child: const Text('Editar')
                                ),
                                SizedBox(width: responsive.wp(5)),
                                FilledButton.tonal(
                                  style: ButtonStyle(
                                    fixedSize: const MaterialStatePropertyAll(Size.infinite),
                                    backgroundColor: MaterialStatePropertyAll(Colors.red.shade100),
                                    textStyle: const MaterialStatePropertyAll(TextStyle(fontWeight: FontWeight.bold))
                                  ),
                                  onPressed: () {},
                                  child: const Text('Eliminar')
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      FilledButton(
                        onPressed: () => context.pushNamed(''),
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
}