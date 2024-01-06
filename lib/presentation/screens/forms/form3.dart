import 'package:flutter/material.dart';

class Form3 extends StatefulWidget {
  const Form3({super.key});

  @override
  State<Form3> createState() => _Form3State();
}

class _Form3State extends State<Form3> {
  int _value = 1;
  TextEditingController inputNombre = TextEditingController();
  TextEditingController inputCargo = TextEditingController();
  TextEditingController inputTelefono = TextEditingController();
  TextEditingController inputNCuenta = TextEditingController();
  String? selectValued;
  List<String> dropdownItems = ['1', '2', '3', '4'];
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
            child: TextField(
              controller: inputNombre,
              decoration: const InputDecoration(
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
            child: TextField(
              controller: inputCargo,
              decoration: const InputDecoration(
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
            child: TextField(
              controller: inputTelefono,
              decoration: const InputDecoration(
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
                  value: 1,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = 1;
                    });
                  },
                ),
                const Text("Ahorro"),
                Radio(
                  value: 2,
                  groupValue: _value,
                  onChanged: (value) {
                    setState(() {
                      _value = 2;
                    });
                  },
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
            child: const Text('Número de cuenta'),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
            padding: const EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey)),
            child: TextField(
              controller: inputNCuenta,
              decoration: const InputDecoration(
                hintText: "Ingrese número de cuenta",
                hintStyle: TextStyle(fontSize: 12.0),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: ElevatedButton(
                  onPressed: () {
//                    MaterialPageRoute route =
//                        MaterialPageRoute(builder: (context) => const Form3());
//                    Navigator.push(context, route);
                  },
                  child: const Text("Enviar")))
        ],
      ),
    );
  }
}
