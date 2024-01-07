import 'package:ecomap/presentation/screens/screens.dart';
import 'package:ecomap/presentation/widgets/auth/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/providers/auth_provider.dart';


class ResetPasswordScreen extends StatelessWidget {
  static const String name = 'reset_password_screen';

  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsive.hp(5)),
            Text('Restablece tu\ncontraseña', style: texts.displaySmall),
            SizedBox(height: responsive.hp(3)),
            Text('Ingresa una nueva contraseña', style: texts.titleLarge),
            SizedBox(height: responsive.hp(10)),
            Form(
              key: authProvider.formKey2,
              child: Column(
                children: [
                  CustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock_outline,
                    hintText: 'Contraseña',
                    isNotVisible: true,
                    onChanged: (value) => authProvider.password = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese la nueva contraseña';
                      } else if (value.length < 8) {
                        return 'Mínimo 8 caracteres';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: responsive.hp(2)),
                  CustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock_outline,
                    hintText: 'Repetir contraseña',
                    isNotVisible: true,
                    onChanged: (value) => authProvider.confirmPassword = value,
                    validator: (value) {
                      if (value == null || value.isEmpty && authProvider.password.isNotEmpty) {
                        return 'Por favor confirme la contraseña';
                      } else if (authProvider.password != authProvider.confirmPassword) {
                        return 'La contraseña no coincide';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: responsive.hp(5)),
                  FilledButton(
                    onPressed: authProvider.isLoading ? null : () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (authProvider.formKey2.currentState?.validate() == true) {
                        // authProvider.isLoading = true;
        
                        // final errorMessage = await firebaseAuthService.login(authProvider.email.trim(), authProvider.password.trim());
                        // switch (errorMessage) {
                        //   case 'success':
                        //     context.pushReplacementNamed(HomeScreen.name);
                        //     authProvider.isLoading = false;
                        //     break;
                        //   case null:
                        //     authProvider.isLoading = false;
                        //     Future.microtask(() => showSnackBar(context, 'Lo sentimos, no se pudo iniciar sesión'));
                        //     break;
                        //   case 'user-not-found':
                        //     authProvider.isLoading = false;
                        //     Future.microtask(() => showSnackBar(context, 'No se ha encontrado una cuenta con ese correo electrónico'));
                        //     break;
                        //   case 'wrong-password':
                        //     authProvider.isLoading = false;
                        //     Future.microtask(() => showSnackBar(context, 'Correo o contraseña incorrecto'));
                        //     break;
                        //   default:
                        //     authProvider.isLoading = false;
                        //     Future.microtask(() => showSnackBar(context, 'Correo o contraseña inválido'));
                        //     break;
                        // }
                        context.pushReplacementNamed(LoginScreen.name);
                      }
                    },
                    child: authProvider.isLoading 
                    ? const CircularProgressIndicator(color: Colors.grey, strokeCap: StrokeCap.round)
                    : const Text('Confirmar contraseña')
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}