import 'package:ecomap/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:provider/provider.dart';


class Form3Screen extends StatelessWidget {
  static const String name = 'form3_screen';

  const Form3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final socioProvider = context.watch<SocioBosqueProvider>();
    final generalProvider = context.watch<GeneralProvider>();

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
              title: Head(title: 'Organización')
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Contacto', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Form(
                    child: Column(
                      children: [
                        CustomInputText(
                          label: 'Nombre',
                          hintText: 'Ingrese el nombre',
                          controller: socioProvider.nombreContactoController,
                        ),
                        CustomInputText(
                          label: 'Cargo en la organización',
                          hintText: 'Ingrese el cargo',
                          controller: socioProvider.cargoContactoController,
                        ),
                        CustomInputText(
                          label: 'Teléfono',
                          hintText: 'Ingrese el teléfono',
                          keyboardType: TextInputType.number,
                          controller: socioProvider.telefonoContactoController,
                        ),
                      ],
                    ),
                  ),
                ),
                Text('Cuenta Bancaria', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Form(
                    child: Column(
                      children: [
                        CustomRadioButton(
                          label: 'Tipo de Cuenta',
                          titles: const ['Ahorro', 'Corriente'],
                          values: const ['Ahorro', 'Corriente'],
                          groupValue: socioProvider.tipoCuenta,
                          onChanged: (value) => socioProvider.tipoCuenta = value,
                        ),
                        CustomDropdownButton(
                          label: 'Institución Financiera',
                          hintText: 'Seleccione banco',
                          controller: socioProvider.institucionCuentaController,
                          options: generalProvider
                            .bancos
                            .map((x) => DropdownMenuEntry(value: x, label: x))
                            .toList(),
                          onSelected: (value){
                            socioProvider.institucionCuenta = value;
                          },
                          initialSelection: socioProvider.institucionCuenta,
                        ),
                        CustomInputText(
                          label: 'Número de cuenta',
                          hintText: 'Ingrese número de cuenta',
                          keyboardType: TextInputType.number,
                          controller: socioProvider.numeroCuentaController,
                        ),
                        FilledButton(
                          onPressed: () => context.pushNamed(Form4Screen.name),
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