import 'package:go_router/go_router.dart';

import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/screens/tutorial/app_tutorial_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/tutorial', // Redirige a /tutorial inicialmente
  routes: [
    // Ruta para el tutorial
    GoRoute(
      path: '/tutorial',
      name: AppTutorialScreen.name, // Nombre de la pantalla de tutorial
      builder: (context, state) {
        return const AppTutorialScreen(); // Pantalla de tutorial
      },
      // Una vez que se complete el tutorial, se redirige a la pantalla principal
    ),

    // Ruta para la pantalla principal HomeScreen
    GoRoute(
      path: '/home/:page', // Asegúrate de que el path sea correcto
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.params['page'] ?? '0');
        return HomeScreen(pageIndex: pageIndex);
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.params['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        ),
      ],
    ),

    // Ruta de redirección por defecto (si el usuario accede sin ruta específica)
    GoRoute(
      path: '/',
      redirect: (context, state) =>
          '/tutorial', // Si el usuario accede sin ruta, redirige al tutorial
    ),
  ],
);
