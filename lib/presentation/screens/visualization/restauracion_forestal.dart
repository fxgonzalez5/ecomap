
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/widgets/forms/custom_input_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VisualizationRestauracionForestalScreen extends StatefulWidget {
  static const String name = 'visualization_restauracion_forestal_screen';

  const VisualizationRestauracionForestalScreen({ super.key });

  @override
  _RestauracionForestalState createState() => _RestauracionForestalState();
}

class _RestauracionForestalState extends State<VisualizationRestauracionForestalScreen> {
  
  @override
  void initState() {
    Provider.of<RestauracionForestalProvider>(context, listen: false).getAll();
  }
  
  
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 70,
            child: Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar formulario',
                  suffixIcon: Icon(Icons.search, size: 50,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )
                )
              ),
            )
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: buildItems(context),
            ),
          )
        ],
      ),
    );
    // return Scaffold(
    //   body: CustomScrollView(
    //     slivers: [
    //       SliverAppBar(
    //         collapsedHeight: responsive.hp(8),
    //         expandedHeight: responsive.hp(12),
    //         pinned: true,
    //         flexibleSpace: const FlexibleSpaceBar(
    //           centerTitle: true,
    //           expandedTitleScale: 1,
    //           titlePadding: EdgeInsets.zero,
    //           title: CustomInputText(label:'',hintText: 'Buscar formulario'),
    //         ),
    //       ),
    //       SliverPadding(
    //         padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
    //         sliver: SliverList.list(
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.only(top: 15),
    //               child: Form(
    //                 child: Column(
    //                   children: buildItems(context),
    //                 ),
    //               ),
    //             )
    //           ]
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  buildItems(BuildContext context){
    final restauracionProvider = context.watch<RestauracionForestalProvider>();
    final texts = Theme.of(context).textTheme;

    return restauracionProvider.listRestauracion
      .map((x) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('Código ficha: ${x.beneficiario.codigoFicha}',style: texts.titleMedium),
            subtitle: Text(x.detalle.fechaLanzamiento == null ? '--' : x.detalle.fechaLanzamiento.toString().split(' ')[0], style: texts.bodyMedium,),
          ),
        ),
      ))
      .toList();
  }
}