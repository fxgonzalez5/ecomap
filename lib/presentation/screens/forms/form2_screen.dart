import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomap/presentation/screens/screens.dart';


class Form2Screen extends StatelessWidget {
  static const String name = 'form2_screen';

  const Form2Screen({super.key});

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
            margin: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
            child: const Text(
              'Notificaciones',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Dirección'),
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
                hintText: "Ingrese Dirección",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Provincia'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: DropdownButton<String>(
              hint: const Text('seleccionar una opcion'),
              value: null,
              items: const [],
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Cantón'),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child:DropdownButton<String>(
              hint: const Text('seleccionar una opcion'),
              value: null,
              items: const [],
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Parroquia'),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: DropdownButton<String>(
              hint: const Text('seleccionar una opcion'),
              value: null,
              items: const [],
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Comunidad'),
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
                hintText: "Ingrese Comunidad",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Teléfono Convencional'),
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
                hintText: "Ingrese número de teléfono",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Teléfono Celular'),
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
                hintText: "Ingrese número celular",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: const Text('Correo Electrónico'),
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
                hintText: "Ingrese correo",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: ElevatedButton(
                  onPressed: () => context.pushNamed(Form3Screen.name),
                  child: const Text("Siguiente")))
        ],
      ),
   );
  }
}