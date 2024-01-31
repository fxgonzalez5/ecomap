import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:ecomap/presentation/widgets/widgets.dart';


class EmailScreen extends StatelessWidget {
  static const String name = 'email_screen';

  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: responsive.wp(20),
        leading: TextButton(
          onPressed: () => context.pop(),
          child: Text('Volver', style: TextStyle(fontSize: responsive.ip(1.6)),),
        ),
      ),
      body: const _EmailView()
   );
  }
}

class _EmailView extends StatelessWidget {
  const _EmailView();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final authProvider = context.watch<AuthProvider>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: responsive.hp(5)),
          Text('Restablece tu\ncontraseña', style: texts.displaySmall),
          SizedBox(height: responsive.hp(3)),
          Text('Ingresa tu correo y te enviaremos instrucciones para reiniciar tu contraseña', style: texts.titleLarge),
          SizedBox(height: responsive.hp(10)),
          Form(
            key: authProvider.formKey1,
            child: Column(
              children: [
                CustomTextFormField(
                   keyboardType: TextInputType.emailAddress,
                   prefixIcon: Icons.email_outlined,
                   hintText: 'example@dominio.com',
                   onChanged: (value) => authProvider.email = value,
                   validator: (value) {
                     String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                     RegExp regExp = RegExp(pattern);
                     
                     if (value == null || value.isEmpty) {
                       return 'Por favor ingrese el correo electrónico';
                     } else if (!regExp.hasMatch(value)) {
                       return 'El valor ingresado no luce como un correo';
                     }
                     
                     return null;
                   },
                ),
                SizedBox(height: responsive.hp(5)),
                FilledButton(
                  onPressed: authProvider.isLoading ? null : () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (authProvider.formKey1.currentState?.validate() == true) {
                      authProvider.recoveryPassword(context);
                    }
                  },
                  child: authProvider.isLoading 
                  ? const CircularProgressIndicator(color: Colors.grey, strokeCap: StrokeCap.round)
                  : const Text('Restablecer contraseña')
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}