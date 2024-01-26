
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FormRestauracionForestalBeneficiarioScreen extends StatefulWidget {
  static const String name = 'form_restauracion_forestal_beneficiario_screen';
  FormRestauracionForestalBeneficiarioScreen({ super.key });

  @override
  _BeneficiarioScreenState createState() => _BeneficiarioScreenState();
}

class _BeneficiarioScreenState extends State<FormRestauracionForestalBeneficiarioScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final restauracionProvider = context.watch<RestauracionForestalProvider>();
    
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
              title: Head(title: 'Beneficiario')
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Datos generales', style: texts.titleLarge),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInputText(
                          label: 'Código de ficha',
                          hintText: 'Ingrese el código',
                          keyboardType: TextInputType.text,
                          controller: restauracionProvider.codigoFichaController,
                        ),
                        CustomInputText(
                          label: 'Número de cédula',
                          hintText: 'Ingrese la cédula',
                          keyboardType: TextInputType.number,
                          controller: restauracionProvider.cedulaController,
                        ),
                        CustomInputText(
                          label: 'Nombre beneficiario',
                          hintText: 'Ingrese el nombre del beneficiario',
                          keyboardType: TextInputType.text,
                          controller: restauracionProvider.nombreController,
                        ),
                        Text('Detalles levantamiento', style: texts.titleLarge),
                        SizedBox(height: 15,),
                        CustomInputText(
                          label: 'Fecha de lanzamiento',
                          hintText: 'mm/dd/yyyy',
                          keyboardType: TextInputType.none,
                          controller: restauracionProvider.fechaController,
                          onTap: () async{
                            final response = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:DateTime(DateTime.now().year),
                              lastDate: DateTime(DateTime.now().year + 1),
                              cancelText: "Cancelar",
                              confirmText: "Guardar"
                            );
                            restauracionProvider.fechaLanzamiento = response == null ? 
                                null : 
                                response.toString().split(' ')[0];
                            restauracionProvider.fechaController.text = restauracionProvider.fechaLanzamiento ?? '';
                          },
                        ),
                        CustomInputText(
                          label: 'Equipo GPS utilizado',
                          hintText: 'Ingrese el equipo GPS',
                          keyboardType: TextInputType.text,
                          controller: restauracionProvider.equipoGPSController,
                        ),
                        FilledButton(
                          onPressed: () => context.pushNamed(FormRestauracionForestalUbicacionScreen.name),
                          child: const Text('Siguiente')
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
/*
class FormRestauracionForestalBeneficiarioScreen extends StatelessWidget {
  static const String name = 'form_restauracion_forestal_beneficiario_screen';
  const FormRestauracionForestalBeneficiarioScreen({ super.key });

  
}*/