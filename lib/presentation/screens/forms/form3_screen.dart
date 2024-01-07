import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Form3Screen extends StatelessWidget {
  static const String name = 'form3_screen';

  const Form3Screen({super.key});

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
        children: <Widget>[
          Container(
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            child: const Text(
              'Contacto',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Nombre'),
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
                hintText: "Ingrese Nombre",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Cargo en la organización'),
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
                hintText: "Ingrese el Cargo",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Teléfono'),
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
                hintText: "Ingrese el Teléfono",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 10.0, top: 10.0),
            child: const Text(
              'Cuenta Bancaria',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: const Text('Tipo de Cuenta'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  value: 'Ahorro',
                  groupValue: 'Ahorro',
                  onChanged: (value) { },
                ),
                const Text("Ahorro"),
                Radio(
                  value: 'Corriente',
                  groupValue: 'Ahorro',
                  onChanged: (value) {},
                ),
                const Text("Corriente"),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: const Text('Institución Financiera'),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            child: DropdownButton<String>(
              hint: const Text('seleccionar banco'),
              value: null,
              items: const [],
              onChanged: (newValue) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
            child: const Text('Número de cuenta'),
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
                hintText: "Ingrese número de cuenta",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navegar a la siguiente pantalla
                  },
                  child: const Text("Siguiente")))
        ],
      ),
   );
  }
}