import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecomap/config/theme/responsive.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:ecomap/presentation/services/firebase_auth_service.dart';


class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.green,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.white10
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.65,
              1
            ]
          )
        )
      ),
      leading: const Icon(Icons.home),
      title: const Text('Home'),
      actions: [
        IconButton(
          icon: const Icon(Icons.exit_to_app,),
          onPressed: () async {
            await FirebaseAuthService().logout();
            context.pushReplacementNamed(LoginScreen.name);
          },
        )
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: const _HomeView()
   );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return Stack(
      children: [
        const _BackgroundImage(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: responsive.hp(12)),
              Text('Bienvenido Nombre', style: texts.headlineMedium),
              const Spacer(),
              _CustomCard(
                text: 'Resgistrar Formulario',
                imagePath: 'assets/images/card1.png',
                onTap: () => context.pushNamed(Form1Screen.name)
              ),
              _CustomCard(
                text: 'Reportes',
                imagePath: 'assets/images/card2.png',
                onTap: () => print('click'), // TODO: Navegar a la pantalla correspondiente
              ),
              _CustomCard(
                text: 'Visualizar Información',
                imagePath: 'assets/images/card3.png',
                onTap: () => print('click'), // TODO: Navegar a la pantalla correspondiente
              ),
              const Spacer(flex: 2,),
            ],
          ),
        )
      ],
    );
  }
}

class _CustomCard extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback? onTap;

  const _CustomCard({
    required this.text,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: responsive.hp(17.5),
        margin: EdgeInsets.symmetric(vertical: responsive.hp(2)),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(responsive.ip(0.5))
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(responsive.wp(5), responsive.wp(1.5), responsive.wp(2.5), responsive.wp(1.5)),
          color: Colors.black54,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.menu, size: responsive.ip(3.5), color: Colors.white)
              ),
              const Spacer(),
              Text(text, style: texts.headlineMedium),
              SizedBox(height: responsive.hp(2.5))
            ],
          ),
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset('assets/images/background.png', fit: BoxFit.cover,),
    );
  }
}