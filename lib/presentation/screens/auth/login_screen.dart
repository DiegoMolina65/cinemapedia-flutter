import 'package:cinemapedia/config/helpers/snackbar_helper_cooldown.dart';
import 'package:cinemapedia/presentation/providers/auth/auth_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';

  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          const HeaderPainter(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Bienvenido",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Inicia sesión para continuar",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      _LoginInputs(
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                      const SizedBox(height: 20),
                      _LoginFinalScreen(
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _LoginInputs extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const _LoginInputs({
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: "Correo electrónico",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: "Contraseña",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
          ),
        ),
      ],
    );
  }
}

class _LoginFinalScreen extends ConsumerWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const _LoginFinalScreen({
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              final String email = emailController.text.trim();
              final String password = passwordController.text.trim();

              if (email.isEmpty || password.isEmpty) {
                SnackBarHelper.showSnackBar(
                    context, "Por favor, completa todos los campos");
                return;
              }

              final authRepository = ref.read(authRepositoryProvider);

              final user =
                  await authRepository.signInWithEmailPassword(email, password);

              if (user != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Bienvenido, ${user.email}")),
                );
                context.go('/tutorial');
              } else {
                SnackBarHelper.showSnackBar(
                    context, "Credenciales Incorrectas");
              }
            },
            child: const Text("Iniciar Sesión"),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              textStyle: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("¿No tienes cuenta?"),
            TextButton(
              onPressed: () {
                context.push('/register');
              },
              child: const Text("Regístrate"),
            ),
          ],
        ),
      ],
    );
  }
}
