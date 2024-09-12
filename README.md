Flutter Theme Change Example
This is a simple Flutter app that demonstrates how to switch between light, dark, and system themes at runtime using Flutter's ChangeNotifier and AnimatedBuilder.

Features
1. Toggle between light, dark, and system default themes.
2. Implements state management using ValueChangeNotifier. You can extend to your prefered state management tool like Providers, Riverpod, Bloc, etc.
3. Dynamic theme changes are reflected instantly in the UI.

How It Works
1. ThemeModel: A ValueChangeNotifier that holds the current theme mode (light, dark, or system) and notifies listeners whenever the theme is changed.
2. AnimatedBuilder: Used to rebuild the MaterialApp when the theme is changed by listening to changes in the ThemeModel.
3. ThemeSettings Screen: Provides buttons to switch between the different themes.

