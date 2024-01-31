import 'package:ecomap/domain/models/control_forestal.dart';
import 'package:ecomap/presentation/providers/control_forestal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControlForestalList extends StatefulWidget {
  final Function(ControlForestal)? onTap;
  const ControlForestalList({ super.key, required this.onTap });

  @override
  State<ControlForestalList> createState() => _ControlForestalListState();
}

class _ControlForestalListState extends State<ControlForestalList> {
  @override
  void initState() {
    super.initState();
    Provider.of<ControlForestalProvider>(context, listen: false).getAll();
  }

  @override
  Widget build(BuildContext context) {
    final controlProvider = context.watch<ControlForestalProvider>();
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
              onChanged: (value) => controlProvider.listFilter(value),
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
    final restauracionProvider = context.watch<ControlForestalProvider>();
    final texts = Theme.of(context).textTheme;
    final list = restauracionProvider.listForm;

    List<Widget> data = [];
    for (var i = 0; i < list.length; i++) {
      final x = list[i];
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
                  Text('Sistema Nacional de Control Forestal', style: texts.titleMedium,),
                  Text('Dueño: ${x.datosPropietario.nombre ?? '--'}', style: texts.bodyMedium,),
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