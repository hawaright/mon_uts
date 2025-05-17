import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Paramètres"),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text("Mode sombre"),
            value: themeProvider.isDarkMode,
            onChanged: (val) {
              themeProvider.toggleTheme(val);
            },
            secondary: Icon(Icons.brightness_6),
          ),
        ],
      ),
    );
  }
}
