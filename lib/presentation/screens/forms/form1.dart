import 'package:app/form2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class Form1 extends StatefulWidget {
  const Form1({super.key});

  @override
  State<Form1> createState() => _Form1State();
}

enum Capitulos { paramo, bosque }

class _Form1State extends State<Form1> {
  int _groupValue = 1;
  int _groupValue1 = 1;
  TextEditingController inputRUC = TextEditingController();
  TextEditingController inputRepresentanteL = TextEditingController();
  TextEditingController inputRegistroD = TextEditingController();
  TextEditingController inputEtnia = TextEditingController();

  String? selectValued;
  List<String> dropdownItems = ['1', '2', '3', '4'];
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Center(
              child: Text("Mi aplicación"),
            ),
            Text(
              "Mi aplicación",
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 65, 197, 230)),
            ),
          ],
        ),
        leading: const BackButton(),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Tipo de Socio'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: DropdownButton<String>(
              hint: const Text(
                'seleccionar una opcion',
                style: TextStyle(fontSize: 14.0),
              ),
              value: selectValued,
              items: dropdownItems.map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectValued = newValue;
                });
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: const Text('Tipo de Capitulo'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: 1,
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = 1;
                    });
                  },
                ),
                const Text("Páramo"),
                Radio(
                  value: 2,
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = 2;
                    });
                  },
                ),
                const Text("Bosque"),
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
            child: TextField(
              controller: inputRUC,
              decoration: const InputDecoration(
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
            child: TextField(
              controller: inputRepresentanteL,
              decoration: const InputDecoration(
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
            child: TextField(
              controller: inputRegistroD,
              decoration: const InputDecoration(
                hintText: "Ingrese el número",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          _FormDatePicker(
            date: date,
            onChanged: (value) {
              setState(() {
                date = value;
              });
            },
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
            child: TextField(
              controller: inputEtnia,
              decoration: const InputDecoration(
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
                    value: 1,
                    groupValue: _groupValue1,
                    onChanged: (value) {
                      setState(() {
                        _groupValue1 = value!;
                      });
                    }),
                const Text("Si"),
                Radio(
                    value: 2,
                    groupValue: _groupValue1,
                    onChanged: (value) {
                      setState(() {
                        _groupValue1 = value!;
                      });
                    }),
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
                  onPressed: () {
                    MaterialPageRoute route =
                        MaterialPageRoute(builder: (context) => const Form2());
                    Navigator.push(context, route);
                  },
                  child: const Text("Siguiente")))
        ],
      ),
    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged onChanged;

  const _FormDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  State<_FormDatePicker> createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
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
                intl.DateFormat.yMd().format(widget.date),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          TextButton(
            child: const Text('Editar'),
            onPressed: () async {
              var newDate = await showDatePicker(
                context: context,
                initialDate: widget.date,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );

              // Don't change the date if the date picker returns null.
              if (newDate == null) {
                return;
              }

              widget.onChanged(newDate);
            },
          )
        ],
      ),
    );
  }
}
