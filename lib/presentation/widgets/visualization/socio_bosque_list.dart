
import 'package:ecomap/domain/domain.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocioBosqueList extends StatefulWidget {
  final Function(SocioBosque)? onTap;
  const SocioBosqueList({ super.key, this.onTap });

  @override
  State<SocioBosqueList> createState() => _SocioBosqueListState();
}

class _SocioBosqueListState extends State<SocioBosqueList> {

  @override
  void initState() {
    super.initState();
    Provider.of<SocioBosqueProvider>(context, listen: false).getAll();
  }
  
  @override
  Widget build(BuildContext context) {
    final socioProvider = context.watch<SocioBosqueProvider>();
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
              onChanged: (value) => socioProvider.listFilter(value),
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
    final socioProvider = context.watch<SocioBosqueProvider>();
    final texts = Theme.of(context).textTheme;
    final listForm = socioProvider.listForm;

    List<Widget> data = [];
    for (var i = 0; i < listForm.length; i++) {
      final x = listForm[i];
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
                  Text('Proyecto Socio Bosque', style: texts.titleMedium,),
                  Text('Representante: ${x.datosGenerales.representante ?? '--'}', style: texts.bodyMedium,),
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