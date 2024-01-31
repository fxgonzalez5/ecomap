
import 'package:ecomap/domain/domain.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestauracionForestalList extends StatefulWidget {
  final Function(RestauracionForestal)? onTap;
  const RestauracionForestalList({ super.key, this.onTap });

  @override
  State<RestauracionForestalList> createState() => _RestauracionForestalListState();
}

class _RestauracionForestalListState extends State<RestauracionForestalList> {

  @override
  void initState() {
    super.initState();
    Provider.of<RestauracionForestalProvider>(context, listen: false).getAll();
  }
  
  @override
  Widget build(BuildContext context) {
    final restauracionProvider = context.watch<RestauracionForestalProvider>();
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar formulario',
                suffixIcon: Icon(Icons.search, size: 40, color: Theme.of(context).colorScheme.primary,),
              ),
              onChanged: (value) => restauracionProvider.restauracionFilter(value),
            ),
          )
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: buildItems(context),
          ),
        )
      ],
    );
  }

  buildItems(BuildContext context){
    final restauracionProvider = context.watch<RestauracionForestalProvider>();
    final texts = Theme.of(context).textTheme;
    final listRestauracion = restauracionProvider.listRestauracion;

    List<Widget> data = [];
    for (var i = 0; i < listRestauracion.length; i++) {
      final x = listRestauracion[i];
      data.add(
        Card(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
            child: ListTile(
              onTap: widget.onTap == null ? null : () => widget.onTap!(x),
              title: Text('Formulario N°${i+1}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: texts.titleSmall!.fontSize
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Programa Nacional de Restauración Forestal', style: texts.titleMedium,),
                  Text('Beneficiario: ${x.beneficiario.nombre ?? '--'}', style: texts.bodyMedium,),
                  Text(x.fechaRegistro.toString().split(' ')[0], style: texts.bodyMedium,),
                ]
              )
            ),
          ),
        )
      );
    }
    
    return data.toList();
  }
}