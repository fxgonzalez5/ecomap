import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Form5Screen extends StatefulWidget {
  static const String name = 'form5_screen';
  
  const Form5Screen({super.key});

  @override
  State<Form5Screen> createState() => _Form5ScreenState();
}

class _Form5ScreenState extends State<Form5Screen> {
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
              title: Head(title: 'Socioeconómicos')
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Principales Actividades Económicas', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Column(
                    children: [
                      CustomInputText(
                        label: 'Nombre Actvidad',
                        hintText: 'Ingrese nombre',
                        controller: socioProvider.nombreActividad,
                      ),
                      CustomInputText(
                        label: 'Descripción',
                        hintText: 'Ingrese una breve descripción',
                        controller: socioProvider.descripcionActividad,
                      ),
                      FilledButton.tonal(
                        style: ButtonStyle(
                          fixedSize: const MaterialStatePropertyAll(Size.infinite),
                          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: responsive.wp(10)))
                        ),
                        onPressed: () => socioProvider.agregarActidad(),
                        child: const Text('Agregar')
                      ),
                      SizedBox(height: responsive.hp(3.5)),
                      CustomInputText(
                        label: 'Promedio de Ingresos (\$/mes)',
                        hintText: 'Ingrese un monto',
                        keyboardType: TextInputType.number,
                        controller: socioProvider.promedioIngresoSE,
                      ),
                    ],
                  ),
                ),
                Text('Lista de Actividades', style: texts.titleLarge),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Column(
                    children: [
                      Container(
                        height: responsive.hp(24),
                        margin: EdgeInsets.only(top: responsive.hp(2), bottom: responsive.hp(1.5)),
                        child: ListView(
                          children: socioProvider.actividadesSE.map((x) => 
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Text(x.nombre ?? '--', style: texts.bodyLarge,),
                                  subtitle: Text(x.descripcion ?? '--', style: texts.bodyMedium,),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete,),
                                    onPressed: ()=> socioProvider.eliminarActividad(x),
                                  ),
                                ),
                              ),
                            ))
                          .toList()
                        )
                      ),
                      FilledButton(
                        onPressed: () => context.pushNamed(Form6Screen.name),
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