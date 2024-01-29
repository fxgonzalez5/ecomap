import 'package:dotted_border/dotted_border.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


class Form9Screen extends StatelessWidget {
  static const String name = 'form9_screen';

  const Form9Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final socioProvider = context.watch<SocioBosqueProvider>();

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
              title: Head(title: 'Adicionales')
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Tipos de Uso de Suelo', style: texts.titleLarge),
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Column(
                    children: [
                      CustomInputText(
                        label: 'Tipo de Uso de Suelo',
                        hintText: 'Ingrese nombre',
                        controller: socioProvider.tipoSuelo,
                      ),
                      CustomInputText(
                        label: 'Superficie (Ha)',
                        hintText: 'Ingrese superficie',
                        controller: socioProvider.superficieSuelo,
                      ),
                      FilledButton.tonal(
                        style: ButtonStyle(
                          fixedSize: const MaterialStatePropertyAll(Size.infinite),
                          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: responsive.wp(10)))
                        ),
                        onPressed: () => socioProvider.agregarSuelo(),
                        child: const Text('Agregar')
                      ),
                      SizedBox(height: responsive.hp(3.5)),
                    ],
                  ),
                ),
                Text('Lista de Usos del Suelo', style: texts.titleLarge),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: Column(
                    children: [
                      Container(
                        height: responsive.hp(24),
                        margin: EdgeInsets.only(top: responsive.hp(2), bottom: responsive.hp(3.5)),
                        child: ListView(
                          children: socioProvider.suelos.map((x) => 
                            Card(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: ListTile(
                                  title: Text(x.tipo ?? '--', style: texts.bodyLarge,),
                                  subtitle: Text(x.superficie ?? '--', style: texts.bodyMedium,),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete,),
                                    onPressed: ()=> socioProvider.eliminarSuelo(x),
                                  ),
                                ),
                              ),
                            ))
                          .toList()
                        )
                      ),
                    ],
                  ),
                ), 
                SizedBox(height: responsive.hp(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: CustomRadioButton(
                    label: '¿El predio cuenta con cerramiento?',
                    groupValue: socioProvider.cerramiento,
                    onChanged: (value) => socioProvider.cerramiento = value,  
                  ),
                ),
                Text('Croquis del predio', style: texts.titleLarge),
                const _ImageUpload(),
                Text('Declaración Juramentada', style: texts.titleLarge),
                const _TermsAndConditions(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
                  child: FilledButton(
                    onPressed: socioProvider.isLoading ? null : () => socioProvider.submitForm(context),
                    child: socioProvider.isLoading ? 
                        const CircularProgressIndicator(color: Colors.grey, strokeCap: StrokeCap.round) :
                        Text(socioProvider.current != null ? 'Actualizar':'Guardar')
                  ),
                )
              ],
            ),
          )
        ]
      )
   );
  }
}

class _TermsAndConditions extends StatelessWidget {
  const _TermsAndConditions();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final socioProvider = context.watch<SocioBosqueProvider>();

    return Padding(
      padding: EdgeInsets.fromLTRB(responsive.wp(5), responsive.hp(2), responsive.wp(5), responsive.hp(3.5)),
      child: Row(
        children: [
          Radio(
            value: true,
            groupValue: socioProvider.declaracion,
            onChanged: (value)=> socioProvider.declaracion = value
          ),
          Flexible(child: Text('Declaro que todos los datos proporcionados en el presente formulario son verídicos', style: texts.bodyLarge))
        ],
      ),
    );
  }
}
class _ImageUpload extends StatelessWidget {
  const _ImageUpload();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final provider = context.watch<SocioBosqueProvider>();

    return Padding(
      padding: EdgeInsets.fromLTRB(responsive.wp(5), responsive.hp(2), responsive.wp(5), responsive.hp(3.5)),
      child: Row(
        children: [
          Expanded(
            child: DottedBorder(
              color: Colors.grey.shade400,
              borderType: BorderType.RRect,
              dashPattern: const [5],
              child: SizedBox(
                height: responsive.hp(20),
                child: Center(
                  child: provider.croquisURL == null ? 
                    Text('Subir imagen', style: texts.bodyLarge) :
                    Image.network(provider.croquisURL!)
                ),
              ),
            ),
          ),
          SizedBox(width: responsive.wp(5)),
          FilledButton.tonal(
            style: const ButtonStyle(
              fixedSize: MaterialStatePropertyAll(Size.infinite),
              textStyle: MaterialStatePropertyAll(TextStyle(fontWeight: FontWeight.bold))
            ),
            onPressed: ()=> uploadImage(context),
            child: const Icon(Icons.upload)
          ),
        ],
      ),
    );
  }

  Future<void> uploadImage(BuildContext context) async {
    final provider = context.read<SocioBosqueProvider>();
    // Seleccionar imagen desde la galería
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    // Obtener referencia al bucket de Firebase Storage
    final firebaseStorageRef = FirebaseStorage.instance.ref().child('images/${DateTime.now()}.png');

    // Subir la imagen al bucket
    await firebaseStorageRef.putFile(File(pickedFile.path));

    // Obtener la URL de descarga
    provider.croquisURL = await firebaseStorageRef.getDownloadURL();

  }
}