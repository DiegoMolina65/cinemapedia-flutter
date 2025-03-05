import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Un simple boolean
final isDarkmodeProvider = StateProvider((ref) => false);

// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {

  // STATE = Estado = new AppTheme();
  ThemeNotifier(): super( AppTheme() );
  
  void toggleDarkMode() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }
}
