import 'package:cinemapedia/config/helpers/snackbar_helper_cooldown.dart';
import 'package:cinemapedia/presentation/providers/auth/auth_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  static const name = 'register-screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    final genderController = TextEditingController();

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
                        "Crear Cuenta",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Regístrate para continuar",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      _RegisterInputs(
                        emailController: emailController,
                        passwordController: passwordController,
                        nameController: nameController,
                        genderController: genderController,
                      ),
                      const SizedBox(height: 20),
                      _RegisterFinalScreen(
                        emailController: emailController,
                        passwordController: passwordController,
                        nameController: nameController,
                        genderController: genderController,
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

class _RegisterInputs extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController genderController;

  const _RegisterInputs({
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.genderController,
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
        const SizedBox(height: 20),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: "Nombre",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 20),
        DropdownButtonFormField<String>(
          value: genderController.text.isEmpty ? null : genderController.text,
          decoration: const InputDecoration(
            labelText: "Género",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.wc),
          ),
          items: const [
            DropdownMenuItem(
              value: "Masculino",
              child: Text("Masculino"),
            ),
            DropdownMenuItem(
              value: "Femenino",
              child: Text("Femenino"),
            ),
            DropdownMenuItem(
              value: "Otros",
              child: Text("Otros"),
            ),
          ],
          onChanged: (value) {
            genderController.text = value ?? "";
          },
          isExpanded: true,
        ),
      ],
    );
  }
}

class _RegisterFinalScreen extends ConsumerWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController genderController;

  const _RegisterFinalScreen({
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.genderController,
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
              final String name = nameController.text.trim();
              final String gender = genderController.text.trim();

              if (email.isEmpty ||
                  password.isEmpty ||
                  name.isEmpty ||
                  gender.isEmpty) {
                SnackBarHelper.showSnackBar(
                    context, "Por favor, completa todos los campos");
                return;
              }

              // Obtener el AuthRepository del provider
              final authRepository = ref.read(authRepositoryProvider);

              // Crear la cuenta con los datos adicionales
              final user = await authRepository.signUpWithEmailPassword(
                email,
                password,
                name,
                gender,
              );

              if (user != null) {
                SnackBarHelper.showSnackBar(
                    context, "Cuenta creada exitosamente");
                context.push('/login');
              } else {
                SnackBarHelper.showSnackBar(
                    context, "Error al crear la cuenta");
              }
            },
            child: Text("Registrarse"),
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
            const Text("¿Ya tienes cuenta?"),
            TextButton(
              onPressed: () {
                context.push('/login');
              },
              child: const Text("Inicia sesión"),
            ),
          ],
        ),
      ],
    );
  }
}
