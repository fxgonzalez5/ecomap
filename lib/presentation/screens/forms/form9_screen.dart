import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';


class Form9Screen extends StatelessWidget {
  static const String name = 'form9_screen';

  const Form9Screen({super.key});

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
              title: Head(title: 'Adicionales')
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Tipos de Uso de Suelo', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Column(
                    children: [
                      const CustomInputText(
                        label: 'Tipo de Uso de Suelo',
                        hintText: 'Ingrese nombre',
                      ),
                      const CustomInputText(
                        label: 'Superficie (Ha)',
                        hintText: 'Ingrese superficie',
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
                    ],
                  ),
                ),
                Text('Lista de Usos del Suelo', style: texts.titleLarge),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Column(
                    children: [
                      Container(
                        height: responsive.hp(14),
                        margin: EdgeInsets.only(top: responsive.hp(2), bottom: responsive.hp(3.5)),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Text('Uso de suelo $index', style: texts.bodyLarge,),
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
                    ],
                  ),
                ), 
                Text('Lista de Usos del Suelo', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: const CustomRadioButton(label: '¿El predio cuenta con cerramiento?'),
                ),
                Text('Croquis del predio', style: texts.titleLarge),
                const _ImageUpload(),
                Text('Declaración Juramentada', style: texts.titleLarge),
                const _TermsAndConditions(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: FilledButton(
                    onPressed: () {
                      // TODO: Guardar en las base de datos
                    },
                    child: const Text('Guardar')
                  ),
                )
              ],
            ),
          )
        ]
      )
   );
  }
}

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(responsive.wp(5), responsive.hp(2), responsive.wp(5), responsive.hp(3.5)),
      child: Row(
        children: [
          Radio(
            value: true,
            groupValue: false,
            onChanged: (value) {}
          ),
          Flexible(child: Text('Declaro que todos los datos proporcionados en el presente formulario son verídicos', style: texts.bodyLarge))
        ],
      ),
    );
  }
}

class _ImageUpload extends StatelessWidget {
  const _ImageUpload();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(responsive.wp(5), responsive.hp(2), responsive.wp(5), responsive.hp(3.5)),
      child: Row(
        children: [
          Expanded(
            child: DottedBorder(
              color: Colors.grey.shade400,
              borderType: BorderType.RRect,
              dashPattern: const [5],
              child: SizedBox(
                height: responsive.hp(20),
                child: Center(child: Text('Subir imagen', style: texts.bodyLarge)),
              ),
            ),
          ),
          SizedBox(width: responsive.wp(5)),
          FilledButton.tonal(
            style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size.infinite),
              textStyle: MaterialStatePropertyAll(TextStyle(fontWeight: FontWeight.bold))
            ),
            onPressed: () {},
            child: const Icon(Icons.upload)
          ),
        ],
      ),
    );
  }
}