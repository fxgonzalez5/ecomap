import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/providers/control_forestal.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FormControlForestaPoblacionScreen extends StatefulWidget {
  static const String name = 'form_control_forestal_poblacion_screen';
  const FormControlForestaPoblacionScreen({ super.key });

  @override
  _PropietarioState createState() => _PropietarioState();
}

class _PropietarioState extends State<FormControlForestaPoblacionScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final controlProvider = context.watch<ControlForestalProvider>();
    final generalProvider = context.watch<GeneralProvider>();

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
              title: Head(title: 'Población Demandante'),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Población que depende del sector forestal', style: texts.titleLarge),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInputText(
                          label: 'Dueños del predio',
                          hintText: 'Ingrese número',
                          keyboardType: TextInputType.number,
                          controller: controlProvider.propietariosController,
                        ),
                        CustomInputText(
                          label: 'Regentes',
                          hintText: 'Ingrese número',
                          keyboardType: TextInputType.number,
                          controller: controlProvider.regentesController,
                        ),
                        CustomInputText(
                          label: 'Ejecutores (Comerciantes de madera)',
                          hintText: 'Ingrese el número de especímenes',
                          keyboardType: TextInputType.number,
                          controller: controlProvider.ejecutoresController,
                        ),
                        CustomInputText(
                          label: 'Dueños de industrias forestales',
                          hintText: 'Ingrese el número',
                          keyboardType: TextInputType.number,
                          controller: controlProvider.propietariosIndustriasController,
                        ),
                        CustomInputText(
                          label: 'Motosierristas',
                          hintText: 'Ingrese el número',
                          keyboardType: TextInputType.number,
                          controller: controlProvider.motosierristasController,
                        ),
                        CustomInputText(
                          label: 'Transportistas de la madera',
                          hintText: 'Ingrese el número',
                          keyboardType: TextInputType.number,
                          controller: controlProvider.transportistasMaderaController,
                        ),
                        FilledButton(
                          onPressed: controlProvider.isLoading ? null : () => controlProvider.submitForm(context),
                          child: controlProvider.isLoading ? 
                            const CircularProgressIndicator(color: Colors.grey, strokeCap: StrokeCap.round) :
                            Text(controlProvider.current != null ? 'Actualizar':'Guardar')
                        ),
                      ]
                    )
                  )
                )
              ]
            )
          )
        ],
      ),
    );
  }
}