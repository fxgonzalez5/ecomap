import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FormRestauracionForestalPotenciacionScreen extends StatefulWidget {
  static const String name = 'form_restauracion_forestal_potenciacion_screen';
  
  const FormRestauracionForestalPotenciacionScreen({ super.key });

  @override
  _PotenciacionScreenState createState() => _PotenciacionScreenState();
}

class _PotenciacionScreenState extends State<FormRestauracionForestalPotenciacionScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final restauracionProvider = context.watch<RestauracionForestalProvider>();
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: responsive.hp(8),
            expandedHeight: responsive.hp(15),
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              expandedTitleScale: 1,
              titlePadding: EdgeInsets.zero,
              title: Head(title: 'Potenciación viveros')
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Datos Viveros', style: texts.titleLarge),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInputText(
                          label: 'Número de viveros',
                          hintText: 'ingrese la cantidad de viveros',
                          keyboardType: TextInputType.number,
                          controller: restauracionProvider.cantidadController,
                        ),
                        CustomInputText(
                          label: 'Actividades realizadas',
                          hintText: 'ingrese las actividades realizadas',
                          keyboardType: TextInputType.text,
                          controller: restauracionProvider.actividadesController,
                        ),
                        // Text('Informe de actividades', style: texts.titleLarge),
                        // SizedBox(height: 15,),
                        FilledButton(
                          onPressed: restauracionProvider.isLoading ? null :  ()=> restauracionProvider.submitForm(context),
                          child:  restauracionProvider.isLoading ? 
                            const CircularProgressIndicator(color: Colors.grey, strokeCap: StrokeCap.round) :
                            Text(restauracionProvider.currentRestauracionForestal != null ? 'Actualizar':'Guardar')
                        )
                      ],
                    ),
                  ),
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}