import 'package:ecomap/config/helpers/show_scnack_bar.dart';
import 'package:ecomap/presentation/screens/home/home_screen.dart';
import 'package:ecomap/presentation/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/providers/providers.dart';


class LoginScreen extends StatelessWidget {
  static const String name = 'login_screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: responsive.hp(5), horizontal: responsive.wp(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsive.hp(5)),
            Text('Bienvenido', style: texts.displaySmall),
            SizedBox(height: responsive.hp(3)),
            const _CenterImage(),
            SizedBox(height: responsive.hp(5)),
            const _LoginForm(),
            SizedBox(height: responsive.hp(1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿Olvidaste tu contraseña?'),
                TextButton(
                  onPressed: () {
                    // TODO: Navegar a la pantalla para restablecer la contraseña
                  },
                  child: const Text('Click aquí', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                )
              ],
            )
          ],
        ),
      )
   );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final firebaseAuthService = FirebaseAuthService();
    final loginProvider = context.watch<LoginProvider>();

    return Form(
      key: loginProvider.formKey,
      child: Column(
        children: [
          _CustomTextFormField(
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.person_outline,
            hintText: 'Correo',
            onChanged: (value) => loginProvider.email = value,
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
          SizedBox(height: responsive.hp(2)),
          _CustomTextFormField(
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Icons.lock_outline,
            hintText: 'Contraseña',
            isNotVisible: true,
            onChanged: (value) => loginProvider.password = value,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese la contraseña';
              } else if (value.length < 8) {
                return 'Mínimo 8 caracteres';
              }

              return null;
            },
          ),
          SizedBox(height: responsive.hp(5)),
          FilledButton(
            onPressed: loginProvider.isLoading ? null : () async {
              FocusScope.of(context).requestFocus(FocusNode());
              if (loginProvider.formKey.currentState?.validate() == true) {
                loginProvider.isLoading = true;

                final errorMessage = await firebaseAuthService.login(loginProvider.email.trim(), loginProvider.password.trim());
                switch (errorMessage) {
                  case 'success':
                    context.pushReplacementNamed(HomeScreen.name);
                    loginProvider.isLoading = false;
                    break;
                  case null:
                    loginProvider.isLoading = false;
                    Future.microtask(() => showSnackBar(context, 'Lo sentimos, no se pudo iniciar sesión'));
                    break;
                  case 'user-not-found':
                    loginProvider.isLoading = false;
                    Future.microtask(() => showSnackBar(context, 'No se ha encontrado una cuenta con ese correo electrónico'));
                    break;
                  case 'wrong-password':
                    loginProvider.isLoading = false;
                    Future.microtask(() => showSnackBar(context, 'Correo o contraseña incorrecto'));
                    break;
                  default:
                    loginProvider.isLoading = false;
                    Future.microtask(() => showSnackBar(context, 'Correo o contraseña inválido'));
                    break;
                }
              }
            },
            child: loginProvider.isLoading 
            ? const CircularProgressIndicator(color: Colors.grey, strokeCap: StrokeCap.round)
            : const Text('Iniciar Sesión')
          )
        ],
      )
    );
  }
}

class _CustomTextFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final IconData prefixIcon;
  final String hintText;
  final bool isNotVisible;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  

  const _CustomTextFormField({
    this.keyboardType,
    required this.prefixIcon,
    required this.hintText,
    this.isNotVisible = false,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return TextFormField(
      autocorrect: false,
      keyboardType: keyboardType,
      obscureText: isNotVisible,
      style: TextStyle(fontSize: responsive.ip(1.8)),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: responsive.hp(1.75)),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(3.5)),
          child: Icon(prefixIcon, size: responsive.ip(3)),
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: responsive.ip(1.8), color: Colors.grey, fontWeight: FontWeight.normal)
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}

class _CenterImage extends StatelessWidget {
  const _CenterImage();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: responsive.hp(4),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.25, color: colors.primary))
          ),
          child: Text('Iniciar Sesión', style: TextStyle(fontSize: responsive.ip(2), color: colors.primary)), 
        ),
        Image.asset('assets/images/image_login.png', width: double.infinity, height: responsive.hp(30), fit: BoxFit.cover,)
      ],
    );
  }
}