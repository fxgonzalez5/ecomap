import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FormRestauracionForestalPotenciacionScreen extends StatefulWidget {
  static const String name = 'form_restauracion_forestal_potenciacion_screen';
  
  const FormRestauracionForestalPotenciacionScreen({ super.key });

  @override
  State<FormRestauracionForestalPotenciacionScreen> createState() => _PotenciacionScreenState();
}

class _PotenciacionScreenState extends State<FormRestauracionForestalPotenciacionScreen> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final restauracionProvider = context.watch<RestauracionForestalProvider>();
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: responsive.hp(12),
            expandedHeight: responsive.hp(15),
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              expandedTitleScale: 1,
              titlePadding: EdgeInsets.zero,
              title: Head(title: 'Potenciación viveros')
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: responsive.hp(2.5), horizontal: responsive.wp(5)),
            sliver: SliverList.list(
              children: [
                Text('Datos Viveros', style: texts.titleLarge),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInputText(
                          label: 'Número de viveros',
                          hintText: 'ingrese la cantidad de viveros',
                          keyboardType: TextInputType.number,
                          controller: restauracionProvider.cantidadController,
                        ),
                        CustomInputText(
                          label: 'Actividades realizadas',
                          hintText: 'ingrese las actividades realizadas',
                          keyboardType: TextInputType.text,
                          controller: restauracionProvider.actividadesController,
                        ),
                        Text('Informe de actividades', style: texts.titleLarge),
                        const _ImageUpload(),
                        const SizedBox(height: 15,),
                        FilledButton(
                          onPressed: restauracionProvider.isLoading ? null :  ()=> restauracionProvider.submitForm(context),
                          child:  restauracionProvider.isLoading ? 
                            const CircularProgressIndicator(color: Colors.grey, strokeCap: StrokeCap.round) :
                            Text(restauracionProvider.currentRestauracionForestal != null ? 'Actualizar':'Guardar')
                        )
                      ],
                    ),
                  ),
                )
              ]
            ),
          ),
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
    final provider = context.watch<RestauracionForestalProvider>();

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
                  child: provider.informeImagenURL == null ? 
                    Text('Subir imagen', style: texts.bodyLarge) :
                    Image.network(provider.informeImagenURL!)
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
    final provider = context.read<RestauracionForestalProvider>();
    // Seleccionar imagen desde la galería
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    // Obtener referencia al bucket de Firebase Storage
    final firebaseStorageRef = FirebaseStorage.instance.ref().child('images/${DateTime.now()}.png');

    // Subir la imagen al bucket
    await firebaseStorageRef.putFile(File(pickedFile.path));

    // Obtener la URL de descarga
    provider.informeImagenURL = await firebaseStorageRef.getDownloadURL();

  }
}