import 'package:flutter/material.dart';

void main() {
  runApp(const ThemeChangeExample());
}

class ThemeChangeExample extends StatefulWidget {
  const ThemeChangeExample({super.key});
  @override
  State<ThemeChangeExample> createState() {
    return _ThemeChangeExampleState();
  }
}

class _ThemeChangeExampleState extends State<ThemeChangeExample> {
  final ValueNotifier<ThemeMode> _theme =
      ValueNotifier<ThemeMode>(ThemeMode.system);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _theme,
      builder: (context, value, child) {
        return MaterialApp(
          home: ThemeSettings(
            onChangeTheme: (theme) {
              switch (theme) {
                case 'dark':
                  _theme.value = ThemeMode.dark;
                  break;
                case 'light':
                  _theme.value = ThemeMode.light;
                  break;
                default:
                  _theme.value = ThemeMode.system;
              }
            },
            currentTheme: value,
          ),
          themeMode: value,
          darkTheme: ThemeData(colorScheme: const ColorScheme.dark()),
        );
      },
    );
  }
}

class ThemeSettings extends StatefulWidget {
  final Function(String theme) onChangeTheme;
  final ThemeMode currentTheme;
  const ThemeSettings(
      {super.key, required this.onChangeTheme, required this.currentTheme});

  @override
  State<ThemeSettings> createState() => _ThemeSettingsState();
}

List<String> themeList = ThemeMode.values.map((e) => e.name).toList();

class _ThemeSettingsState extends State<ThemeSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme Settings"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Choose Theme"),
            Column(
              children: [
                DropdownMenu(
                  width: double.infinity,
                  initialSelection: widget.currentTheme.name,
                  onSelected: (value) {
                    widget.onChangeTheme(value!);
                  },
                  dropdownMenuEntries: themeList
                      .map<DropdownMenuEntry<String>>(
                        (String value) => DropdownMenuEntry(
                            value: value, label: value.toUpperCase()),
                      )
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
