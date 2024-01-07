import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomap/presentation/screens/screens.dart';


class Form1Screen extends StatelessWidget {
  static const String name = 'form1_screen';

  const Form1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Datos'),
            Text('Orgnización', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 65, 197, 230)))
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Tipo de Socio'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: DropdownButton<String>(
              hint: const Text(
                'Seleccione una opcion',
                style: TextStyle(fontSize: 14.0),
              ),
              value: null,
              items: const [],
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: const Text('Tipo de Capitulo'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: Column(
              children: [
                RadioListTile(
                  title: const Text("Páramo"),
                  value: 'Páramo',
                  groupValue: 'Páramo',
                  onChanged: (value) {},
                ),
                RadioListTile(
                  title: const Text("Bosque"),
                  value: 'Bosque',
                  groupValue: 'Páramo',
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
            child: const Text(
              'Datos generales',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Número de RUC'),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
            padding: const EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey)),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Ingrese el RUC",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Representante Legal'),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
            padding: const EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey)),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Ingrese representante",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Número de Registro de la Directiva'),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            padding: const EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey)),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Ingrese el número",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          _FormDatePicker(
            date: DateTime.now(),
            onChanged: (value) {},
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Etnia'),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            padding: const EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey)),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Ingrese Etnia",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text(
                '¿Los integrantes de la Organización viven en el predio?'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                    value: true,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                const Text("Si"),
                Radio(
                    value: false,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                const Text("No"),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: ElevatedButton(
                  onPressed: () => context.pushNamed(Form2Screen.name),
                  child: const Text("Siguiente")))
        ],
      ),
   );
  }
}

class _FormDatePicker extends StatelessWidget {
  final DateTime date;
  final ValueChanged onChanged;
  
  const _FormDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Fecha',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                intl.DateFormat.yMd().format(date),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          TextButton(
            child: const Text('Editar'),
            onPressed: () async {
              var newDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );

              // Don't change the date if the date picker returns null.
              if (newDate == null) {
                return;
              }

              onChanged(newDate);
            },
          )
        ],
      ),
    );
  }
}