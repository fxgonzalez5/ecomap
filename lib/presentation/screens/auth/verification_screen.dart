import 'package:ecomap/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class VerificationScreen extends StatelessWidget {
  static const String name = 'verification_screen';

  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final authProvider = context.read<AuthProvider>();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: responsive.hp(5), horizontal: responsive.wp(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('¡Revisa tu correo!', style: texts.displaySmall),
            SizedBox(height: responsive.hp(3)),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Se ha enviado un correo a ', 
                    style: texts.titleLarge
                  ),
                  TextSpan(
                    text: authProvider.email,
                    style: texts.titleLarge!.copyWith(color: Colors.red)  
                  ),
                  TextSpan(
                  text: ' con instrucciones para reiniciar tu contraseña.',
                    style: texts.titleLarge
                  )
                ]
              )
            ),
            const Spacer(),
            FilledButton(
              onPressed: () => context.pop(),
              child: const Text('Continuar')
            )
          ],
        ),
      )
   );
  }
}